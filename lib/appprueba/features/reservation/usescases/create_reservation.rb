class CreateReservation

  @reservation_repository

  def initialize(reservation_repository, movie_schedule_repository)
    @reservation_repository = reservation_repository
  end

  def create(reservation)
    # check if movie exist, movie has that date and movie has caopacity free
    @reservation_repository.create(reservation)
  end

end