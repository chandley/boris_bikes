module BikeContainer

  DEFAULT_CAPACITY = 10

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(number)
    capacity = number
  end

  def bike_count
    bikes.count  
  end

  def dock(incoming_bike)
    raise "Station is full" if full?
    bikes.push incoming_bike
  end

  def release(bike)
    bikes.delete(bike) 
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    #@bikes.reject {|bike| bike.broken?}
    bikes.reject(&:broken?)
  end

end