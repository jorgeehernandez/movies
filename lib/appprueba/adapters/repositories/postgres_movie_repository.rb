require_relative '../../features/reservation/usescases/port/movie_repository'
require_relative '../../features/reservation/domain/movie'

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
    movies = @movies_data_source.get(query).each_with_object({}) do |item, result|
      puts item.to_s
      if result[item[:movie_id]]
        result[item[:movie_id]].dates << item[:date]
      else
        result[item[:movie_id]] = Movie.new(item[:movie_id], item[:name], item[:description], item[:image_ur], Set.new([item[:date]]), item[:capacity])
      end
    end
    movies.values
  end

end


