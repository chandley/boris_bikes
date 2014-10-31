require './lib/docking_station'
require 'bike_container_spec'

describe DockingStation do

  let(:station) { DockingStation.new(:capacity => 123) }
  
  it_behaves_like "bike_container"

end