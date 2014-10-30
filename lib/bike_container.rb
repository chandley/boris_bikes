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
    raise "Cannot process request" if bike.first.class != Bike
    raise "Station is full" if full?
    bikes << bike.first
  end

  def release(*bike)
 #   raise "Please select bike" if bike == :empty
    raise "Cannot process request" if bikes.delete(bike.first).nil?
    #if bikes.include?(bike)
    #  bikes.delete(bike)
    #else
    #  raise "Bike not there"
    #end

  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

end