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

  def list(query)
    @reservation_data_source.get(query)
  end

end
