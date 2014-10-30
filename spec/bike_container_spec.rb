require './lib/bike_container'

describe BikeContainer do
  include BikeContainer

  let(:bike) {double :bike, broken?: false, is_a?: true}
  let(:broken_bike) {double :bike, broken?: true, is_a?: true}
  let(:other_container) {double :bike_container, available_bikes: [bike], dock: true}
  def fill_bike_container
     capacity.times { dock(bike) }
  end

  it 'should accept a bike' do
    dock(bike)
    expect(bike_count).to eq(1)
  end

  it 'should release a bike' do
    dock(bike)
    release(bike)
    expect(bike_count).to eq(0)
  end

   it "should know when it's full" do
     expect(self).not_to be_full
     fill_bike_container
     expect(self).to be_full
   end 

  it "should not accept a bike when it's full" do
    fill_bike_container
    expect(lambda {dock(bike) }).to raise_error(RuntimeError)
  end

  it 'should only dock the first bike if more than one given' do
    dock(bike, :second_thing, :third_thing)
    expect(bike_count).to eq(1)
  end


  it 'should not allow you to dock something that is not a bike' do
     expect(lambda {dock(:not_a_bike)}).to raise_error(RuntimeError) 
     expect(lambda {dock()}).to raise_error(RuntimeError) 
  end

  it "should not release a bike which isn't there" do
    expect(lambda { release(bike) }).to raise_error(RuntimeError)
  end

  it 'should raise an error if empty argument passed to release' do
    expect(lambda { release()}).to raise_error(RuntimeError)  
  end

  it 'should only release first bike if more than one requested' do
    dock(bike)
    release(bike, :second_thing, :third_thing)
    expect(bike_count).to eq(0)
  end

  it "should provide a list of available bikes" do
    dock(bike)
    dock(broken_bike)
    expect(available_bikes).to eq([bike])
  end

  it 'should move a bike into another container' do
    dock(bike)  
    move(bike,self,other_container)
    expect(available_bikes).to eq([])
    expect(other_container.available_bikes).to eq([bike])
  end
end

