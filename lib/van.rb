require_relative 'bike_container'
require_relative 'bike'


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