class CreateReservation

  @reservation_repository
  @movie_schedule_repository

  def initialize(reservation_repository, movie_schedule_repository)
    @reservation_repository = reservation_repository
    @movie_schedule_repository = movie_schedule_repository
  end

  def create(reservation)
    movie_schedule = @movie_schedule_repository.find_by_reservation(reservation)
    if (movie_schedule)
      @movie_schedule_repository.update_capacity(movie_schedule[:id], reservation.persons)
      @reservation_repository.create(reservation)
    else
      raise "No existe fecha para esta pelicula"
    end
    reservation
  end

end