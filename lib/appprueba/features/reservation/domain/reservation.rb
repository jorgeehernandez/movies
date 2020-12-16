class Reservation
  @id
  @movie_id
  @date
  @persons

  def initialize(id, movie_id, date, persons)
    @id = id
    @movie_id = movie_id
    @date = date
    @persons = persons
  end

  def id
    @id
  end

  def movie_id
    @movie_id
  end

  def date
    @date
  end

  def persons
    @persons
  end

  def as_json(options = {})
    {
      id: @id,
      movie_id: @movie_id,
      date: @date,
      persons: @persons
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def self.from_json(params)
    Reservation.new(generate_id, params[:movie_id], Date.parse(params[:date]), params[:persons])
  end

  def self.generate_id
    Time.now.to_i
  end

end