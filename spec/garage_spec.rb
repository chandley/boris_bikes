require './lib/garage'
require 'bike_container_spec'
require 'spec_helper'

describe Garage do 

  let(:garage) { Garage.new(:capacity => 123) }
  let(:bike) {double :bike, :broken? => true, :is_a? => true }
  
  it_behaves_like "bike_container"
  
  it 'should be able to fix bikes' do
    garage.dock(bike)
    expect(garage.available_bikes.size).to be(0)
    allow(bike).to receive(:fix!)
    allow(bike).to receive(:broken?).and_return(false) 
    garage.fix_bikes # maybe change to fix individual bikes
    expect(garage.available_bikes.size).to be(1)
  end

end