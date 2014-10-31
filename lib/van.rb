require_relative 'bike_container'

class Van 
  include BikeContainer

  def move(bike,from_container,to_container)
    from_container.release(bike)
    to_container.dock(bike)    
  end

  def replenish(container)
    container.broken_bikes.each {|bike| move(bike,container,self)}
  end
end