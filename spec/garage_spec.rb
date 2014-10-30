require 'garage'

describe Garage do 

  let(:garage) { Garage.new(:capacity => 123) }
  let(:bike) {double :bike, :broken? => true, :is_a? => true }
  
  it "should allow setting default capacity on initialising" do
    expect(garage.capacity).to eq(123)
  end
  
  it 'should be able to fix bikes' do
    garage.dock(bike)
    expect(garage.available_bikes.size).to be(0)
    allow(bike).to receive(:fix!)
    allow(bike).to receive(:broken?).and_return(false) 
    garage.fix_bikes # maybe change to fix individual bikes
    expect(garage.available_bikes.size).to be(1)
  end

end