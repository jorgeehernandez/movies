class ReservationDataSource

  require 'sequel'
  require 'pg'

  @db_client
  @reservations_table

  def initialize(db_client)
    @db_client = db_client
    unless @db_client.table_exists?(:reservation)
      @db_client.create_table :reservation do
        primary_key :id
        foreign_key :movie_id, :movies
        foreign_key :movie_date_id, :movies_schedule
        Date :date
        Integer :persons
      end
    end
    @reservations_table = @db_client[:reservation]
  end


  def insert(reservation)
    @reservations_table.insert(:movie_id => reservation.movie_id, :date => reservation.date, :persons => reservation.persons)
  end

  def get(query)
    @reservations_table.all
  end

end