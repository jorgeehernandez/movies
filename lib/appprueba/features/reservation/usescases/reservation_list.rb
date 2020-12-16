class ReservationList

  @reservation_repository

  def initialize(reservation_repository)
    @reservation_repository = reservation_repository
  end

  def list
    @reservation_repository.list
  end

  def list_query(date_from, date_to)
    @reservation_repository.list_query(date_from, date_to)
  end
end
