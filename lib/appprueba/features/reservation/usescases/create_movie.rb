

class CreateMovie

  @movie_repository
  @movie_schedule_repository

  def initialize(movie_repository, movie_schedule_repository)
    @movie_repository = movie_repository
    @movie_schedule_repository = movie_schedule_repository
  end

  def create(movie)
    @movie_repository.create(movie)
    @movie_schedule_repository.create(movie)
    movie
  end
end
