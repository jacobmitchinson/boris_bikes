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
    expect{van.dock(garage.release(bike))}.to change{van.bike_count}.by 1
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


  it 'should take broken bikes but not fixed bikes' do
    bike1 = bike
    bike1.break!
    bike2 = bike
    dock_bikes(station, [bike1, bike2])
    van.take_unavailable_bikes(station.release_unavailable_bikes)
    expect(station.bike_count).to eq(1)
  end

  it "can collect bikes from a station" do
    broken_bike = double :bike, broken?: true, is_a?: Bike
    working_bike = double :bike, broken?: false, is_a?: Bike
    dock_bikes(station, [broken_bike, working_bike])
    van.collect :unavailable_bikes, from: station
    expect(van.bikes).to eq [broken_bike]
  end

  it "can remove bikes once collected" do
    broken_bike = double :bike, broken?: true, is_a?: Bike
    working_bike = double :bike, broken?: false, is_a?: Bike
    dock_bikes(station, [broken_bike, working_bike])
    expect(station).to receive(:release).with broken_bike
    van.collect :unavailable_bikes, from: station
  end

  it 'should release broken bikes into the garage' do
    bike.break!
    van.dock(bike)
    garage.take_unavailable_bikes(van.release_unavailable_bikes)
    expect(garage.bike_count).to eq(1)
  end

  def dock_bikes(station, bikes)
    bikes.each{|bike| station.dock(bike)}
  end
        
end
