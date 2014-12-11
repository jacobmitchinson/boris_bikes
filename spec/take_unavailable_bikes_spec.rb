require './lib/bike_container'
require './lib/take_unavailable_bikes'
require './lib/release_unavailable_bikes'

class TakeUnavailable
  include TakeUnavailableBikes
  include ReleaseUnavailableBikes
  include BikeContainer
end

describe TakeUnavailableBikes do
  let(:bike) {Bike.new}
  let(:holder_take) {TakeUnavailable.new}
  let(:holder_release) {TakeUnavailable.new}

  it 'should transfer an unavailable bike betwen two containers' do
    bike.break!
    holder_release.dock(bike)
    holder_take.take_unavailable_bikes(holder_release.release_unavailable_bikes)
    expect(holder_take.bike_count).to eq(1)
  end

end