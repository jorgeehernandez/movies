require './appprueba/version'

require '../lib/appprueba/data/data_source/movie_data_source'
require '../lib/appprueba/data/data_source/movies_schedule_data_source'
require '../lib/appprueba/data/data_source/reservation_data_source'

require '../lib/appprueba/adapters/repositories/postgres_movie_repository'
require '../lib/appprueba/adapters/repositories/postgres_movie_schedule_repository'
require '../lib/appprueba/adapters/repositories/postgres_reservation_repository'


require '../lib/appprueba/features/reservation/domain/movie'
require '../lib/appprueba/features/reservation/domain/reservation'

require '../lib/appprueba/features/reservation/usescases/create_movie'
require '../lib/appprueba/features/reservation/usescases/create_reservation'


module Appprueba
  class Error < StandardError; end

  require 'set'
  require 'date'

  # movie_data_source = MovieDataSource.new(Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk'))
  # movie_schedule_data_source = MoviesScheduleDataSource.new(Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk'))
  #
  # movie_repository = PostgresMovieRepository.new(movie_data_source)
  # movie_schedule_repository = PostgresMovieScheduleRepository.new(movie_schedule_data_source)
  #
  # movie_usecase = CreateMovie.new(movie_repository, movie_schedule_repository)
  #
  # movie = Movie.new(2345, "the last Numenoreano :  The return of the dark lord", "Narsialian, is the last of the greate people that came from the sea : the men father", "Narsilion.png", Set.new([Date.parse("2019-09-10"), Date.parse("2019-09-10"), Date.parse("2019-09-10"), Date.parse("2019-09-10")]), 10)
  # movie_usecase.create(movie)


  movie_schedule_data_source = MoviesScheduleDataSource.new(Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk'))
  reservation_data_source = ReservationDataSource.new(Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk'))

  reservation_repository = PostgresReservationRepository.new(reservation_data_source)
  movie_schedule_repository = PostgresMovieScheduleRepository.new(movie_schedule_data_source)

  reservation_usecase = CreateReservation.new(reservation_repository, movie_schedule_repository)
  reservation = Reservation.new(2345, Date.today, 3)

  reservation_usecase.create(reservation)

end
