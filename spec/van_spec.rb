require './lib/van'
require_relative 'bike_container_spec'

describe Van do
  it_behaves_like 'a bike container'

  context 'it can interact with garage and docking station' do
    
    let(:van) {Van.new}
    let(:bike) {double :bike}
    let(:broken_bike) {double :bike, broken?: true}
    let(:docking_station) {double :docking_station}
    let(:garage) {double :garage}

    it 'knows about moving things' do
      allow(docking_station).to receive(:release)
      allow(docking_station).to receive(:dock)
      expect(van.move(bike,docking_station,van))
    end

    it 'moves all broken bikes from docking station to van' do
      allow(docking_station).to receive(:release)
      allow(docking_station).to receive(:broken_bikes).and_return([broken_bike])
      van.replenish(docking_station)
      expect(van.broken_bikes).to eq([broken_bike])
    end

    it 'moves all fixed bikes from van to docking station' do
     van.dock(broken_bike)
     allow(docking_station).to receive(:broken_bikes).and_return([])
     allow(docking_station).to receive(:dock)
     van.replenish(docking_station)
     expect(van.available_bikes).to eq([])
    end
    

  end
  
end