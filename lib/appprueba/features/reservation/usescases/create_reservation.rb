class CreateReservation

  @reservation_repository
  @movie_schedule_repository

  def initialize(reservation_repository, movie_schedule_repository)
    @reservation_repository = reservation_repository
    @movie_schedule_repository = movie_schedule_repository
  end

  def create(reservation)
    movie_schedule = @movie_schedule_repository.find_by_reservation(reservation)
    puts movie_schedule.to_s
    if(movie_schedule.length > 0)
      @movie_schedule_repository.update_capacity(movie_schedule[:id], reservation.persons)
      @reservation_repository.create(reservation)
    end

  end


end