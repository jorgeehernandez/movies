require_relative '../../features/reservation/usescases/port/movie_repository'

class PostgresMovieRepository

  include MovieRepository

  @movies_data_source

  def initialize(movies_data_source)
    @movies_data_source = movies_data_source
  end

  def create(movie)
    @movies_data_source.insert(movie)
  end

  def list(query)
    @movies_data_source.get(query)
  end

end


