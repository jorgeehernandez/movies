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

  def update_capacity(persons)
    @movies_schedule_data_source.update(persons)
  end

end