require 'rails_helper'

RSpec.describe MapService do
  describe 'class methods' do
    it 'accesses map service and contains lat/long' do
      location = 'Denver, CO'

      result = MapService.locations(location)

      expect(result).to have_key(:latLng)
      expect(result[:latLng]).to have_key(:lat)
      expect(result[:latLng]).to have_key(:lng)
    end

    it 'accesses map service and finds travel time' do
      start_city = 'Denver, CO'
      end_city = 'Estes Park, CO'

      result = MapService.time(start_city, end_city)

      expect(result).to have_key(:formattedTime)
      expect(result[:formattedTime]).to eq("01:22:19")
    end
  end
end
