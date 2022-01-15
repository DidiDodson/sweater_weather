require 'rails_helper'

describe "Forecast API" do
  it "gets a forecast data for a specific location" do
    location = 'Denver, CO'
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:id]).to eq(nil)
    expect(result[:type]).to eq('forecast')
    expect(result[:attributes][:current_weather]).to have_key(:temperature)
    expect(result[:attributes][:current_weather]).to_not have_key(:dew_point)
    expect(result[:attributes][:daily_weather].count).to eq(5)
    expect(result[:attributes][:daily_weather].first).to have_key(:conditions)
    expect(result[:attributes][:daily_weather].first).to_not have_key(:moonrise)
    expect(result[:attributes][:hourly_weather].count).to eq(8)
    expect(result[:attributes][:hourly_weather].first).to have_key(:temperature)
    expect(result[:attributes][:hourly_weather].first).to_not have_key(:visibility)
  end
end
