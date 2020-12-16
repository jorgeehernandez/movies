class MovieList
  @movie_repository

  def initialize(movie_repository)
    @movie_repository = movie_repository
  end

  def list(query)
    @movie_repository.list(:query)
  end
end
