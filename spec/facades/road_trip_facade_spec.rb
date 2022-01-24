require 'rails_helper'

RSpec.describe RoadTripFacade do
  it 'creates a RoadTrip obj for a trip <= 23 hours' do
    params = {
      origin: 'Denver,CO',
      destination: 'Estes Park,CO'
    }
    result = RoadTripFacade.trip_planner(params)

    expect(result).to be_a(RoadTrip)
    expect(result.travel_time).to eq("01:22:19")
  end

  it 'creates a RoadTrip obj for a trip > 23 hours' do
    params = {
      origin: 'Denver,CO',
      destination: 'New York, NY'
    }
    result = RoadTripFacade.trip_planner(params)

    expect(result).to be_a(RoadTrip)
    expect(result.travel_time).to eq("26:07:39")
  end

  it 'shows impossible if not able to travel' do
    params = {
      origin: 'Denver,CO',
      destination: 'Honolulu, HI'
    }
    result = RoadTripFacade.trip_planner(params)

    expect(result[:travel_time]).to eq("Impossible")
    expect(result[:weather_at_eta][:temperature]).to eq("")
    expect(result[:weather_at_eta][:conditions]).to eq("")
  end
end
