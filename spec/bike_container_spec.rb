require './lib/bike_container'

describe BikeContainer do
  include BikeContainer

  let(:bike) {double :bike, broken?: false, is_a?: true}
  let(:broken_bike) {double :bike, broken?: true, is_a?: true}

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

end





# class ContainerHolder; include BikeContainer; end

# describe BikeContainer  do

#   def fill_holder(holder)
#     holder.capacity.times { holder.dock(Bike.new) }
#   end
  


#   it "should know when it's full" do
#     expect(holder).not_to be_full
#     fill_holder(holder)
#     expect(holder).to be_full
#   end

#   it "should not accept a bike when it's full" do
#     fill_holder(holder)
#     expect(lambda {holder.dock(bike) }).to raise_error(RuntimeError)
#   end

#   it 'should only dock the first bike if more than one given' do
#     holder.dock(bike, :second_thing, :third_thing)
#     expect(holder.bike_count).to eq(1)
#   end

#   it 'should not allow you to dock something that is not a bike' do
#      expect(lambda {holder.dock(:not_a_bike)}).to raise_error(RuntimeError) 
#      expect(lambda {holder.dock()}).to raise_error(RuntimeError) 
#   end

#   it "should not release a bike which isn't there" do
#     expect(lambda { holder.release(bike) }).to raise_error(RuntimeError)
#   end

#   it 'should raise an error if empty argument passed to release' do
#     expect(lambda { holder.release()}).to raise_error(RuntimeError)  
#   end

#   it 'should only release first bike if more than one requested' do
#     holder.dock(bike)
#     holder.release(bike, :second_thing, :third_thing)
#     expect(holder.bike_count).to eq(0)
#   end

#   it "should provide a list of available bikes" do
#     working_bike, broken_bike = Bike.new, Bike.new
#     broken_bike.break!
#     holder.dock(working_bike)
#     holder.dock(broken_bike)
#     expect(holder.available_bikes).to eq([working_bike])
#   end

# end