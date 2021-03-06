
class MovieDataSource

  require 'sequel'
  require 'pg'

  @movies_table
  @db_client

  def initialize(db_client)

    @db_client = db_client

    unless @db_client.table_exists?(:movies)
      @db_client.create_table :movies do
        primary_key :id
        String :name
        String :description
        String :image_url
        unique [:name]
      end
    end

    @movies_table = @db_client[:movies]

  end

  def insert(movie)
    @movies_table.insert(id: movie.id, :name => movie.name, :description => movie.description, :image_url => movie.image_url)
  end

  def get(query)
    @movies_table.join(:movies_schedule, movie_id: :id).all
  end

end