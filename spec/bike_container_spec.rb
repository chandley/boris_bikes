require './lib/bike_container'

shared_examples 'a bike container' do

  let(:container) {described_class.new}
  let(:bike) {double :bike, broken?: false }
  let(:broken_bike) {double :bike, broken?: true }

  def fill_up(container)
    container.capacity.times {container.dock(bike)}
  end

  it 'should have a capacity' do
    expect(container.capacity).to eq(20)
  end

  it 'should allow user to set capcity to 123' do
    container.capacity = 123
    expect(container.capacity).to eq(123)
  end

  it 'should show no available bikes at start' do
    expect(container.available_bikes) == []
  end

  it 'should allow bike to be docked' do
    container.dock(bike)
    expect(container.available_bikes) == [bike]
  end

  it 'should allow a bike to be removed' do
    container.dock(bike)
    container.remove(bike)
    expect(container.available_bikes) == []
  end

  it 'should show a list of available_bikes' do
    container.dock(bike)
    container.dock(broken_bike)
    expect(container.available_bikes).to eq([bike])
  end

  it 'should show a list of broken bikes' do
    container.dock(bike)
    container.dock(broken_bike)
    expect(container.broken_bikes).to eq([broken_bike])
  end

  it 'knows when it is full' do 
    fill_up(container)
    expect(container).to be_full
  end


  # it 'should dock a bike' do
  #   container.dock(bike)


  # end

end


# it 'does a default test' do
#   expect(true).to be true
# end