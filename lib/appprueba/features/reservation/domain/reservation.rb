class Reservation
  @movie_id
  @date

  def initialize(movie_id, date)
    @movie_id = movie_id
    @date = date
  end

  def movie_id
    @movie_id
  end

  def date
    @date
  end
end