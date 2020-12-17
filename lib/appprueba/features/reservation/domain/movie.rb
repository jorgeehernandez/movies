class Movie

  require 'json'
  require 'securerandom'
  require 'date'

  @id
  @name
  @description
  @image_url
  @dates
  @capacity

  def initialize(id, name, description, image_url, dates, capacity)
    @id = id
    @name = name
    @description = description
    @image_url = image_url
    @dates = dates
    @capacity = capacity
  end

  def id
    @id
  end

  def name
    @name
  end

  def description
    @description
  end

  def image_url
    @image_url
  end

  def dates
    @dates
  end

  def capacity
    @capacity
  end

  def set_capacity(capacity)
    @capacity = capacity
  end

  def as_json(options = {})
    {
      id: @id,
      name: @name,
      description: @description,
      image_url: @name,
      dates: @dates.to_a,
      capacity: @capacity,
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def self.from_json(json)
    Movie.new(generate_id(), json[:name], json[:description], json[:image_url], extract_dates(json[:dates]), json[:dates].length() * 10)
  end

  def self.generate_id
    Time.now.to_i
  end

  def self.extract_dates(json_dates)
    json_dates.map { |json_date| Date.parse(json_date) }.to_set
  end

end