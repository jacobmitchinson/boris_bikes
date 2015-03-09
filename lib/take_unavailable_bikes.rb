module TakeUnavailableBikes

  def take_unavailable_bikes(array)
    array.each do |bike|
      dock(bike)
    end
  end
end