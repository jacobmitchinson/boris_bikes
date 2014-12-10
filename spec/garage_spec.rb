require './lib/garage'
require './lib/bike'

describe Garage do

	it 'should fix bikes' do 
	  bike = Bike.new
	  garage = Garage.new
	  bike.break!
	  garage.accept(bike)
	  expect(bike).not_to be_broken
	end


end