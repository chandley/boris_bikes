require_relative 'bike_container'

class Van
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def replenish(container)
    case true
    when container.is_a?(DockingStation)
      container.broken_bikes.each {|broken_bike| move(broken_bike,container,self)}
      self.available_bikes.each {|bike| move(bike,self,container)}
    when container.is_a?(Garage)
      self.broken_bikes.each {|broken_bike| move(broken_bike,self,container)}
      container.available_bikes.each {|bike| move(bike,container,self)}
    end
  end


end