require './lib/bike_container'
require './lib/bike'
class ContainerHolder; include BikeContainer; end

describe BikeContainer do

	let(:bike) { Bike.new }
	let(:holder) { ContainerHolder.new }

	it 'should accept a bike' do
		expect(holder.bike_count).to eq(0)
		holder.dock(bike)
		expect(holder.bike_count).to eq(1)
	end

  it 'should raise an error if dock is empty' do
    expect(lambda {holder.release(bike) }).to raise_error(RuntimeError, 'There are no bikes!')
  end

  it 'should release a bike' do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end

  it 'should raise an error if no argument is passed to #release' do
    expect(lambda { holder.release() }).to raise_error(RuntimeError, 'No bikes specified')
  end

  it 'should raise an error if an incorrect argument is passed to #release' do
    expect(lambda { holder.release('toast') }).to raise_error(RuntimeError, 'No bikes specified')
  end

  it 'should raise an error if no argument is passed to #dock' do
    expect(lambda { holder.dock() }).to raise_error(RuntimeError, 'No bikes specified')
  end

  it 'should raise an error if an incorrect argument is passed to #dock' do
    expect(lambda { holder.release('toast') }).to raise_error(RuntimeError, 'No bikes specified')
  end

  it 'should find unavailable bikes' do
    bike.break!
    holder.dock(bike)
    docked_bike = holder.unavailable_bikes[0]
    expect(docked_bike).to be_broken
  end

  

end


