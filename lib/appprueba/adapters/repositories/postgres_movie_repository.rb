require_relative '../../features/reservation/usescases/port/movie_repository'
require_relative '../../features/reservation/domain/movie'

class PostgresMovieRepository

  require 'json'
  require 'sequel'
  require 'pg'
  require 'date'
  require 'set'
  include MovieRepository

  @db_client
  @movies_table
  @movies_schedule_table

  def initialize(db_client)
    @db_client = db_client
    # @db_client.drop_table(:movie_schedule)
    # @db_client.drop_table(:movies)
    # @db_client.drop_table(:reservations)

    unless @db_client.table_exists?(:movies)
      @db_client.create_table :movies do
        primary_key :id
        String :name
        String :description
        String :image_url
        unique [:name]
      end
    end

    unless @db_client.table_exists?(:movies_schedule)
      @db_client.create_table(:movies_schedule) do
        primary_key :id
        foreign_key :movie_id, :movies
        Date :date
        Integer :capacity
        unique [:movie_id, :date]
      end
    end

    @movies_table = @db_client[:movies]
    @movies_schedule_table = @db_client[:movies_schedule]

  end

  def create(movie)
    @movies_table.insert(:name => movie.name, :description => movie.description, :image_url => movie.image_url)
  end

  def create_schedule(movie_id, dates, capacity)
    dates.each do |date|
      puts @movies_schedule_table.insert(:movie_id => movie_id, :date => date, :capacity => capacity)
    end
  end

  def list(query)
    movies = @movies_table.join(:movies_schedule, movie_id: :id).all.each_with_object({}) do |item, result|
      if result[item[:movie_id]]
        result[item[:movie_id]].dates << item[:date]
      else
        result[item[:movie_id]] = Movie.new(item[:name], item[:description], item[:image_ur], Set.new([item[:date]]))
      end
    end
    movies.values
  end

end


