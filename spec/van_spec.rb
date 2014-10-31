require 'van'

describe Van do
  
  let(:van) { Van.new(capacity: 10) }
  let(:bike) {double :bike, is_a?: true, broken?: false }
  let(:broken_bike) {double :bike, is_a?: true, 
                                   broken?: true }
  let(:docking_station) {double :docking_station , is_a?: true}
  let(:garage) {double :garage , available_bikes: [:bike], 
                                 broken_bikes: [:broken_bike],
                                 release: nil, 
                                 dock: nil,
                                 class?: Garage}

  # let(:docking_station) {DockingStation.new}
  # let(:garage) {Garage.new}
  


  it "should allow setting initial capacity on initialising" do
    expect(van.capacity).to eq(10)
  end

  it 'loads all broken bikes from docking station' do
    allow(docking_station).to receive(:broken_bikes).and_return([broken_bike])
    allow(docking_station).to receive(:release)
    van.replenish(docking_station)
    expect(van.broken_bikes).to eq([broken_bike])
  end

  it 'delivers all fixed bikes to docking station' do
    allow(docking_station).to receive(:dock)
    van.dock(bike)
    van.replenish(docking_station)
    expect(van.available_bikes).to eq([])
  end

  # it 'loads all bikes from garage' do
  #   garage.dock(bike)
  #   van.replenish(garage)
  #   expect(van.available_bikes).to eq([bike])
  # end

  #  it 'delivers all broken bikes to garage' do
  #   van.dock(broken_bike)
  #   van.replenish(garage)
  #   expect(van.broken_bikes).to eq([])
  # end

end