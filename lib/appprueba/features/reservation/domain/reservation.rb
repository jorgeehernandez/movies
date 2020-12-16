class Reservation
  @movie_id
  @date
  @persons

  def initialize(movie_id, date, persons)
    @movie_id = movie_id
    @date = date
    @persons = persons
  end

  def movie_id
    @movie_id
  end

  def date
    @date
  end

  def persons
    @persons
  end
end