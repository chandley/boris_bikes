require './lib/bike_container'

  shared_examples "bike_container" do

  let(:bike) {double :bike, broken?: false, is_a?: true}
  let(:broken_bike) {double :bike, broken?: true, is_a?: true}  
  
  #this approach seems a bit of a hack
  let(:container) { described_class.new }
  let(:other_container) { described_class.new }
  
  def fill_bike_container
     container.capacity.times { container.dock(bike) }
  end

  it 'should accept a bike' do
    container.dock(bike)
    expect(container.bike_count).to eq(1)
  end

  it 'should release a bike' do
    container.dock(bike)
    container.release(bike)
    expect(container.bike_count).to eq(0)
  end

   it "should know when it's full" do
     expect(container).not_to be_full
     fill_bike_container
     expect(container).to be_full
   end 

  it "should not accept a bike when it's full" do
    fill_bike_container
    expect(lambda {container.dock(bike) }).to raise_error(RuntimeError)
  end

  it 'should only dock the first bike if more than one given' do
    container.dock(bike, :second_thing, :third_thing)
    expect(container.bike_count).to eq(1)
  end


  it 'should not allow you to dock something that is not a bike' do
     expect(lambda {container.dock(:not_a_bike)}).to raise_error(RuntimeError) 
     expect(lambda {container.dock()}).to raise_error(RuntimeError) 
  end

  it "should not release a bike which isn't there" do
    expect(lambda { container.release(bike) }).to raise_error(RuntimeError)
  end

  it 'should raise an error if empty argument passed to release' do
    expect(lambda { container.release()}).to raise_error(RuntimeError)  
  end

  it 'should only release first bike if more than one requested' do
    container.dock(bike)
    container.release(bike, :second_thing, :third_thing)
    expect(container.bike_count).to eq(0)
  end

  it "should provide a list of available bikes" do
    container.dock(bike)
    container.dock(broken_bike)
    expect(container.available_bikes).to eq([bike])
  end

  # not sure that this tests the true functionality needed
  it 'should move a bike into another container' do   
    container.dock(bike)  
    container.move(bike,container,other_container)
    expect(container.available_bikes).to eq([])
    expect(other_container.available_bikes).to eq([bike])
  end

end

