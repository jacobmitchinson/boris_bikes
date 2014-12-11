require_relative 'bike_container'
require_relative 'bike'
require_relative 'release_unavailable_bikes'

class Van

	include BikeContainer

	def take(transfer) 
		bikes << transfer
	end

	def release(transfer)
		transfer << bikes
	end

	def take_broken_bikes(container)
    container.release_broken_bikes do |new_bike| 
      dock(new_bike)
		end
  end




  
end