class DockingStation
DEFAULT_CAPCITY = 10

  def initialize(options = {})
    @bikes = []
    @capacity = options.fetch(:capacity, DEFAULT_CAPCITY)
  end
  def bike_count
    @bikes.size    
  end

  def dock(incoming_bike)
    raise "Station is full" if full?
    @bikes.push incoming_bike
  end

  def release
    outgoing_bike = @bikes.pop # this is done different in example
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    #@bikes.reject {|bike| bike.broken?}
    @bikes.reject(&:broken?)
  end
end

