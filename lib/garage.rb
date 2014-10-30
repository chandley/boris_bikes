require_relative 'bike_container'

class Garage

  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  def fix_bikes
    bikes.select(&:broken?).each(&:fix!)
  end

end