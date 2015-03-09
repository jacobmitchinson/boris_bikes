require './lib/release_unavailable_bikes'
require './lib/bike_container'
require './lib/bike'

class NewName
include BikeContainer
include ReleaseUnavailableBikes

end

describe ReleaseUnavailableBikes do 

  let(:bike) { Bike.new }
  let(:holder) { NewName.new }

  it 'should release unavailable bikes' do 
    bike.break!
    holder.dock(bike)
    holder.release_unavailable_bikes
    expect(holder.bike_count).to eq(0)
  end

end


