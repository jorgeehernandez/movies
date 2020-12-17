require_relative '../../features/reservation/domain/reservation'
require_relative '../../features/reservation/usescases/port/reservation_api'

require_relative '../../features/reservation/usescases/reservation_list'
require_relative '../../features/reservation/usescases/create_reservation'

require_relative '../../data/data_source/reservation_data_source'
require_relative '../../adapters/repositories/postgres_reservation_repository'
module APIRoutes
  class GrapeReservationAPI < Grape::API

    include ReservationAPI

    db_client = Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk')
    reservation_data_source = ReservationDataSource.new(db_client)
    movie_schedule_data_source = MoviesScheduleDataSource.new(db_client)
    reservation_repository = PostgresReservationRepository.new(reservation_data_source)
    movie_schedule_repository = PostgresMovieScheduleRepository.new(movie_schedule_data_source)

    resource :reservations do

      params do
        optional :date_to, type: String
        optional :date_from, type: String
      end
      get do
        reservation_list_usecase = ReservationList.new(reservation_repository)
        date_from = params[:date_from]
        date_to = params[:date_to]
        if (date_from and date_to)
          puts "we have the date #{date_from} and #{date_to}"
          json_reservations = reservation_list_usecase.list_query(Date.parse(date_from), Date.parse(date_to))
        else
          json_reservations = reservation_list_usecase.list.map { |reservation| reservation.as_json(:options) }
        end
        { reservations: json_reservations }
      end

      post do
        reservation_usecase = CreateReservation.new(reservation_repository, movie_schedule_repository)
        reservation = Reservation.from_json(params)
        reservation_usecase.create(reservation)
      end
    end

  end
end