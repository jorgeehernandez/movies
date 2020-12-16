class ReservationDataSource

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
        Date :date
        Integer :persons
      end
    end
    @reservations_table = @db_client[:reservations]
  end

  def insert(reservation)
    @reservations_table.insert(:movie_id => reservation.movie_id, :date => reservation.date, :persons => reservation.persons)
  end


  def get_all
    @reservations_table.all
  end

  def get(date_from, date_to)
    @reservations_table.where(date:  (date_from..date_to)).all
  end

end