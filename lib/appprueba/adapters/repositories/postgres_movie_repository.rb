require '../../features/reservation/usescases/port/movie_repository'
require '../../features/reservation/domain/movie'

class PostgresMovieRepository

  require 'json'
  require 'sequel'
  require 'pg'
  require 'date'
  require 'set'
  include MovieRepository

  @db_client
  @movies_table
  @movies_dates_table

  def initialize(db_client)
    @db_client =  db_client
    # @DB.drop_table(:movies_dates)
    # @DB.drop_table(:movies)

    unless @db_client.table_exists?(:movies)
      @db_client.create_table :movies do
        primary_key :id
        String :name
        String :description
        String :image_url
      end
    end

    unless @db_client.table_exists?(:movies_dates)
      @db_client.create_table(:movies_dates) do
        primary_key :id
        foreign_key :movie_id, :movies
        Date :date
      end
    end

    @movies_table = @db_client[:movies]
    @movies_dates_table = @db_client[:movies_dates]

  end

  def create(movie)
    stored_movie = @movies_table.insert(:name => movie.name, :description => movie.description, :image_url => movie.image_url)
    movie.dates.each do |date|
      puts @movies_dates_table.insert(:movie_id => stored_movie, :date => date)
    end
  end

  def list(query)
    movies = @movies_table.join(:movies_dates, movie_id: :id).all.each_with_object({}) do |item, result|
      if result[item[:movie_id]]
        result[item[:movie_id]].dates << item[:date]
      else
        result[item[:movie_id]] = Movie.new(item[:name], item[:description], item[:image_ur], Set.new([item[:date]]))
      end
    end
    movies.values
  end

end


