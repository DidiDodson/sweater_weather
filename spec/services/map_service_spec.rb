require 'rails_helper'

RSpec.describe MapService do
  describe 'class methods' do
    it 'accesses map service' do
      location = 'Denver, CO'

      result = MapService.locations(location)

      expect(result).to have_key(:latLng)
      expect(result[:latLng]).to have_key(:lat)
      expect(result[:latLng]).to have_key(:lng)
    end
  end
end
