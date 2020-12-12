module CreateMovie

  @movie_repository

  def initialize(movie_repository)
    @movie_repository = movie_repository
  end

  def create(movie)
    @movie_repository.create(movie)
  end
end