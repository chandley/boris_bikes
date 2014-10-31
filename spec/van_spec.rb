require './lib/van'
require 'bike_container_spec'

describe Van do
  
  let(:van) { Van.new(capacity: 10) }
  let(:bike) {double :bike, is_a?: true, broken?: false }
  let(:broken_bike) {double :bike, is_a?: true, 
                                   broken?: true }
  let(:docking_station) {double :docking_station , is_a?: true}
  let(:garage) {double :garage }

  it_behaves_like "bike_container" 
  

 

  it 'loads all broken bikes from docking station' do
    allow(docking_station).to receive(:broken_bikes).and_return([broken_bike])
    allow(docking_station).to receive(:release)
    van.replenish(docking_station)
    expect(van.broken_bikes).to eq([broken_bike])
  end

  it 'delivers all fixed bikes to docking station' do
    allow(docking_station).to receive(:broken_bikes).and_return([])
    allow(docking_station).to receive(:dock)
    van.dock(bike)
    van.replenish(docking_station)
    expect(van.available_bikes).to eq([])
  end

  it 'loads all bikes from garage' do
    allow(garage).to receive(:is_a?).and_return(false,true) # bad
    allow(garage).to receive(:available_bikes).and_return([bike])
    allow(garage).to receive(:release)
    van.replenish(garage)
    expect(van.available_bikes).to eq([bike])
  end

   it 'delivers all broken bikes to garage' do
    allow(garage).to receive(:is_a?).and_return(false,true) # bad
    van.dock(broken_bike)
    allow(garage).to receive(:available_bikes).and_return([])
    allow(garage).to receive(:dock)
    van.replenish(garage)
    expect(van.broken_bikes).to eq([])
  end

end