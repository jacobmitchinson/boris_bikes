module BikeContainer

	DEFAULT_CAPACITY = 10 

  def bikes
	  @bike ||= [] 
	end

  def capacity
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)
    @capacity = value
  end

  def bike_count
    bikes.count
  end

  def dock(bike)
    raise "Station is full" if full?
    bikes << bike
  end

  def release(bike = '')
    if !bikes.empty? && bike.is_a?(Bike) 
      bikes.delete(bike)
    elsif bike == '' || !bike.is_a?(Bike)
      raise 'No bikes specified'
    else
      raise 'There are no bikes!' 
    end
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken? }
  end

end 



