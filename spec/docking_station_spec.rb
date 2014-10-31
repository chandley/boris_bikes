require './lib/docking_station'
require_relative 'bike_container_spec'

describe DockingStation do
  it_behaves_like 'a bike container'
end