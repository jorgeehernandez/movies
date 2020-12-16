class CreateReservation

  @reservation_repository
  @movie_schedule_repository

  def initialize(reservation_repository, movie_schedule_repository)
    @reservation_repository = reservation_repository
    @movie_schedule_repository = movie_schedule_repository
  end

  def create(reservation)
    # check if movie exist, movie has that date and movie has capacity free

    @movie_schedule_repository.update_capacity(reservation.persons)
    @reservation_repository.create(reservation)

  end

end