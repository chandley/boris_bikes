require 'docking_station'

describe DockingStation do 
  def filL_station(station)
    10.times {station.dock(Bike.new)}
  end

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new}

  
  

  it 'should provide a list of working bikes' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break!
    station.dock (working_bike)
    station.dock (broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end
end