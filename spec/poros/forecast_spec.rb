require 'rails_helper'

RSpec.describe Forecast do
  let(:data) do
  {"current": {
    "dt": 1618317040,
    "sunrise": 1618282134,
    "sunset": 1618333901,
    "temp": 284.07,
    "feels_like": 282.84,
    "humidity": 62,
    "uvi": 0.89,
    "visibility": 10000,
    "weather": [
      {
        "id": 500,
        "main": "Rain",
        "description": "light rain",
        "icon": "10d"
      }
    ]},
  "daily": [
      {
        "dt": 1618308000,
        "sunrise": 1618282134,
        "sunset": 1618333901,
        "temp": {
          "min": 275.09,
          "max": 284.07,
        },
        "weather": [
          {
            "id": 500,
            "main": "Rain",
            "description": "light rain",
            "icon": "10d"
          }],
      }],
  "hourly": [
    {
      "dt": 1618315200,
      "temp": 282.58,
      "feels_like": 280.4,
      "pressure": 1019,
      "humidity": 68,
      "dew_point": 276.98,
      "uvi": 1.4,
      "clouds": 19,
      "visibility": 306,
      "wind_speed": 4.12,
      "wind_deg": 296,
      "wind_gust": 7.33,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }]
    }]
  }
  end

  let(:forecast) { Forecast.new(data) }

  it 'exists with attributes' do
    expect(forecast).to be_a(Forecast)
    expect(forecast.id).to eq(nil)
  end
end
