require 'bike_container'
require 'take_unavailable_bikes'

class Garage 

	include BikeContainer
  include TakeUnavailableBikes

	def accept(bike) 
	  bike.fix!
	  dock(bike)
	end
	

end