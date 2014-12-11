module ReleaseUnavailableBikes

  def release_unavailable_bikes 
    unavailable_bikes.each do |bike|
      release(bike)
    end
  end

end