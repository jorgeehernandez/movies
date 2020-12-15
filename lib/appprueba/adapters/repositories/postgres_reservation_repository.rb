require '../../features/reservation/usescases/port/reservation_repository'
require '../../features/reservation/domain/reservation'

class PostgresReservationRepository

  include ReservationRepository

  require 'sequel'
  require 'pg'

  @db_client
  @reservations_table

  def initialize(db_client)
    @db_client = db_client
    unless @db_client.table_exists?(:reservations)
      @db_client.create_table :reservations do
        primary_key :id
        foreign_key :movie_id, :movies
        foreign_key :movie_date_id, :movies_dates
        Date :date
      end
    end
    @reservations_table = @db_client[:reservations]
  end


  def create(reservation)
    @reservations_table.insert(:movie_id => reservation.movie_id, :date => reservation.date)
  end

  def list(query)
    @reservations_table.all
  end
end


var = PostgresReservationRepository.new(Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk'))
reservation = Reservation.new(10, Date.today)
puts var.create(reservation)

# list = var.list(:query)
# puts list[0].dates