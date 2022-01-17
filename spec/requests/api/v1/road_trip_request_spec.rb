require 'rails_helper'

describe "Roadtrip API" do
  it 'happy path - gets a roadtrip' do
    User.create!(email: 'abc987@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '16a8b8cf-81fc-4403-999d-120f63b79443')

    params = {origin: "Denver,CO",
              destination: "Pueblo, CO",
              api_key: "16a8b8cf-81fc-4403-999d-120f63b79443"}

    post "/api/v1/road_trip", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:type]).to eq('road_trip')
    expect(result[:attributes]).to have_key(:weather_at_eta)
  end

  it 'sad path - gets a roadtrip' do
    User.create!(email: 'abc987@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '16a8b8cf-81fc-4403-999d-120f63b79443')

    params = {origin: "Denver,CO",
              destination: "Pueblo, CO",
              api_key: ""}

    post "/api/v1/road_trip", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end

  it 'sad path - gets a roadtrip' do
    User.create!(email: 'abc987@test.com', password: 'ABc123', password_confirmation: 'ABc123', api_key: '16a8b8cf-81fc-4403-999d-120f63b79443')

    params = {origin: "Denver,CO",
              destination: "Pueblo, CO",
              api_key: "abc123"}

    post "/api/v1/road_trip", headers: {"Content-Type": "application/json"}, params: params.to_json

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
