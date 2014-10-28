require 'docking_station'

describe DockingStation do 
  def filL_station
    10.times {station.dock(Bike.new)}
  end

  let(:bike) {Bike.new}
  let(:station) {DockingStation.new}

  it 'should accept a bike' do
    expect(station.bike_count).to eq(0)
    station.dock(bike)
    expect(station.bike_count).to eq(1)  
  end

  it 'should release a bike' do
    station.dock(bike)
    bike = station.release
    expect(station.bike_count).to eq(0)
  end

  it 'should know when it is full' do
    expect(station).not_to be_full
    filL_station
    expect(station).to be_full
  end
  
  it 'should not accept a bike when full' do
    filL_station
    expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)  
  end
end