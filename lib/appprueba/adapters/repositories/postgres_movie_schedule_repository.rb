require_relative '../../features/reservation/usescases/port/movie_schedule_repository'

class PostgresMovieScheduleRepository

  include MovieScheduleRepository

  @movies_schedule_data_source

  def initialize(movies_schedule_data_source)
    @movies_schedule_data_source = movies_schedule_data_source
  end

  def create(movie)
    @movies_schedule_data_source.insert(movie)
  end

  def update_capacity(movie_schedule_id, persons)
    @movies_schedule_data_source.update(movie_schedule_id, persons)
  end

  def find_by_reservation(reservation)
    @movies_schedule_data_source.get_by_movie_date(reservation.movie_id, reservation.date)
  end


end