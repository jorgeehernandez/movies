require_relative '../../features/reservation/domain/movie'

require_relative '../../features/reservation/usescases/port/movie_api'
require_relative '../../features/reservation/usescases/movie_list'
require_relative '../../features/reservation/usescases/create_movie'

require_relative '../../data/data_source/movie_data_source'
require_relative '../../adapters/repositories/postgres_movie_repository'

require_relative '../../data/data_source/movies_schedule_data_source'
require_relative '../../adapters/repositories/postgres_movie_schedule_repository'

require 'json'
require 'grape'
require 'sequel'
module APIRoutes
  class GrapeMovieAPI < Grape::API

    include MovieApi

    db_client = Sequel.connect('postgres://tjhdlczk:FshcurA7e-KhR9dzEQhRbuUG5W2dhsj3@raja.db.elephantsql.com:5432/tjhdlczk')
    movie_data_source = MovieDataSource.new(db_client)
    movie_schedule_data_source = MoviesScheduleDataSource.new(db_client)
    movie_repository = PostgresMovieRepository.new(movie_data_source)
    movie_schedule_repository = PostgresMovieScheduleRepository.new(movie_schedule_data_source)

    resource :movies do
      get do
        movie_list_usecase = MovieList.new(movie_repository)
        json_movies = movie_list_usecase.list(:query).to_json
        { movies: json_movies }
      end

      post do
        movie = Movie.from_json(params)
        create_movie_usecase = CreateMovie.new(movie_repository, movie_schedule_repository)
        create_movie_usecase.create(movie)
      end
    end

  end
end
