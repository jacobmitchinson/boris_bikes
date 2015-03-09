require './lib/docking_station'
require './lib/bike_container'
require './lib/bike'


describe DockingStation do

	let(:station) { DockingStation.new(:capacity => 123) }

	it 'should allow setting default capacity on initialising' do
		expect(station.capacity).to eq(123)
	end



end