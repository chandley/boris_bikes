class DockingStation

  def initialize
    @bikes = []
  end
  def bike_count
    @bikes.size    
  end

  def dock(incoming_bike)
    @bikes.push incoming_bike
  end
end