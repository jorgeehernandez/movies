require_relative '../../features/reservation/usescases/port/reservation_repository'
require_relative '../../features/reservation/domain/reservation'

class PostgresReservationRepository

  include ReservationRepository

  @reservation_data_source

  def initialize(reservation_data_source)
    @reservation_data_source = reservation_data_source
  end

  def create(reservation)
    @reservation_data_source.insert(reservation)
  end

  def list
    @reservation_data_source.get_all.map { |reservation| Reservation.new(reservation[:id], reservation[:movie_id], reservation[:date], reservation[:persons]) }
  end

  def list_query(date_from, date_to)
    @reservation_data_source.get(date_from, date_to)
  end

end
