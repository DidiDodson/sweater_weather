require 'rails_helper'

RSpec.describe WeatherService do
  describe 'class methods' do
    it 'accesses weather service' do
      lat = 39.798240
      long = -105.073120

      result = WeatherService.get_weather(lat, long)

      expect(result).to have_key(:current)
      expect(result[:current]).to have_key(:weather)
      expect(result).to have_key(:hourly)
      expect(result).to have_key(:daily)
    end
  end
end
