require './lib/van.rb'
require './lib/garage.rb'
require './lib/docking_station.rb'

describe Van do 
 
	# REFACTOR !!!!!!!!!!!!!!!!!!!!!!!

	it 'should accept fixed bikes from the garage' do
		bike = Bike.new
		garage = Garage.new
		van = Van.new
		garage.accept(bike)
		van.bikes << garage.bikes # put it inside the method and call the method
		expect(van.bike_count).to eq(1)
    end

    it 'should release bikes into the station' do
    	van = Van.new
    	bike = Bike.new
    	station = DockingStation.new
    	van.dock(bike)
    	station.bikes << van.bikes # do the same as above
    	expect(station.bike_count).to eq(1)
    end

    it 'should accept broken bikes from the station' do
    	bike = Bike.new
    	bike.break!
    	expect(bike).to be_broken # eject the broken bikes and shovel in the van
    end
end
