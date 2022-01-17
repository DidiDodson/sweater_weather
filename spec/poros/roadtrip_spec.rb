require 'rails_helper'

RSpec.describe RoadTrip do
  let(:data) do
    {
      "origin": "Denver, CO",
      "destination": "Estes Park, CO",
      "travel_time": "01:22:19",
      weather_at_eta:{
      "temperature": 59.4,
      "conditions": "partly cloudy with a chance of meatballs"}
      }
  end
  let(:roadtrip) { RoadTrip.new(data) }

  it 'exists with attributes' do
    expect(roadtrip.start_city).to eq("Denver, CO")
    expect(roadtrip.end_city).to eq("Estes Park, CO")
    expect(roadtrip.travel_time).to eq("01:22:19")
    expect(roadtrip.weather_at_eta).to be_a(Hash)
  end
end
