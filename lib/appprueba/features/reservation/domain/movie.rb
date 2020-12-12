class Movie

  @name
  @description
  @image_url
  @dates

  def initialize(name, description, image_url, dates)
    @name = name
    @description = description
    @image_url = image_url
    @dates = dates
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

end