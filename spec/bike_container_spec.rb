require './lib/bike_container'

# class just for test purposes
class ContainerHolder
 include BikeContainer

 # don't we need an initialize
end

describe ContainerHolder do 

  let(:bike) { Bike.new }
  let(:holder) { ContainerHolder.new }

  def fill_holder(holder)
    10.times {holder.dock(Bike.new)}
  end

  it 'should accept a bike' do
    expect(holder.bike_count).to eq(0)
    holder.dock(bike)
    expect(holder.bike_count).to eq(1)
  end

  it 'should release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'should know when it is full' do
    expect(holder).not_to be_full
    fill_holder holder
    expect(holder).to be_full
  end
  
  it 'should not accept a bike when full' do
    fill_holder holder
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)  
  end
end