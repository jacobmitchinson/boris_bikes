require_relative 'bike_container'
require_relative 'release_unavailable_bikes'

class DockingStation 
	
  include ReleaseUnavailableBikes
  include BikeContainer

  def initialize(options = {})
    self.capacity = options.fetch(:capacity, capacity)
  end

  

end
