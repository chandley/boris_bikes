module BikeContainer

DEFAULT_CAPACITY = 20

  def bikes
    @bikes ||= []
  end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end 

  def capacity=(value)
    @capacity = value
  end

  def bike_count
       bikes.count 
  end

  def dock(*bike)
    raise "Cannot process request" unless bike.first.is_a?(Bike)
    raise "Station is full" if full?
    bikes << bike.first
  end

  def release(*bike)
    raise "Cannot process request" if bikes.delete(bike.first).nil?
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

end