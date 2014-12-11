require './lib/van.rb'
require './lib/garage.rb'
require './lib/docking_station.rb'

describe Van do 
 
  let(:bike) { Bike.new }
  let(:garage) { Garage.new }
  let(:van) { Van.new }
  let(:station) { DockingStation.new }

  it 'should accept fixed bikes from the garage' do
    garage.accept(bike)
    van.dock(garage.release(bike))
    expect(van.bike_count).to eq(1)
  end

  it 'should release bikes into the station' do
    van.dock(bike)
    station.dock(van.release(bike))
    expect(station.bike_count).to eq(1)
  end

  it 'should accept bikes from the station that are broken' do
    bike.break!
    station.dock(bike)
    van.take_unavailable_bikes(station.release_unavailable_bikes)
    expect(van.bike_count).to eq(1)
  end

  # it 'should not take fixed bikes from the station' do 
  #   station.dock(bike)
  #   van.take_broken_bikes(station.bikes)
  #   expect(station.bike_count).to eq(1)
  # end

  # it 'should take broken bikes and the broken bike count in the station should go down' do
  #   bike1 = bike
  #   bike1.break!
  #   bike2 = bike
  #   station.dock(bike1)
  #   station.dock(bike2)
  #   van.take_broken_bikes(station)
  #   expect(station.bike_count).to eq(1)
  # end

  it 'should release broken bikes into the garage' do
    bike.break!
    van.dock(bike)
    garage.take_unavailable_bikes(van.release_unavailable_bikes)
    expect(garage.bike_count).to eq (1)
  end
        
end
