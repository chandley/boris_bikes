module BikeContainer

  DEFAULT_CAPACITY = 20
  attr_writer :bikes

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(number)
    @capacity = number
  end

  def bikes
    @bikes ||= []
  end

  def available_bikes
    bikes.reject(&:broken?)
  end

  def broken_bikes
    bikes.select(&:broken?)
  end

  def dock(bike)
    bikes << bike
  end

  def remove(bike)
  end

  def full?
    bikes.size >= capacity ? true : false
  end

end