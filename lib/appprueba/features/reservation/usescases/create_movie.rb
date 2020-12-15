class CreateMovie

  @movie_repository

  def initialize(movie_repository)
    @movie_repository = movie_repository
  end

  def create(movie)
    movie_id = @movie_repository.create(movie)
    @movie_repository.create_schedule(movie_id, movie.dates, 10)
  end
end
