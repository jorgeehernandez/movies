class Movie
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

end