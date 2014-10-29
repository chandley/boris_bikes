require_relative 'bike_container'

class DockingStation

include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
    self.bikes # debug
  end



end

