require_relative 'bike_container'

class Van 

MOVE_BIKE_FROM_VAN_TO_CONTAINER = lambda {|bike| move(bike, self, container)}
MOVE_BIKE_FROM_CONTAINER_TO_VAN = lambda {|bike| self.move(bike, container, self)}

  include BikeContainer

  def move(bike,from_container,to_container)
    from_container.release(bike)
    to_container.dock(bike)    
  end

  def replenish(container) # docking station
  container.broken_bikes.each {|bike| move(bike, container, self)}
  # container.broken_bikes.each &MOVE_BIKE_FROM_CONTAINER_TO_VAN
   self.available_bikes.each   &MOVE_BIKE_FROM_VAN_TO_CONTAINER
  end

  def method_name
    
  end
end