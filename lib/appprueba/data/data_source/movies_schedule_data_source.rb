class MoviesScheduleDataSource

  require 'sequel'
  require 'pg'

  @movies_schedule_table
  @db_client

  def initialize(db_client)
    @db_client = db_client

    unless @db_client.table_exists?(:movies_schedule)
      @db_client.create_table(:movies_schedule) do
        primary_key :id
        foreign_key :movie_id, :movies
        Date :date
        Integer :capacity
        unique [:movie_id, :date]
        constraint(:capacity_min_value) { capacity > 0 }
      end
    end

    @movies_schedule_table = @db_client[:movies_schedule]

  end

  def insert(movie)
    movie.dates.each do |date|
      @movies_schedule_table.insert(:movie_id => movie.id, :date => date, :capacity => movie.capacity)
    end
  end

  def update(persons)
    begin
      @movies_schedule_table.returning(:capacity).update(:capacity => (Sequel.expr(persons) - :capacity) * -1)
    rescue  Sequel::Error => error
      raise "Error for the check #{error}"
    end
  end

end