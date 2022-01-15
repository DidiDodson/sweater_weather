require 'rails_helper'

RSpec.describe BackgroundService do
  describe 'class methods' do
    it 'accesses background image service' do
      search_term = 'Denver Skyline'

      result = BackgroundService.images(search_term)[:results]

      expect(result.first).to have_key(:urls)
      expect(result.first[:urls]).to have_key(:full)
      expect(result.first).to have_key(:tags)
      expect(result.first[:tags][0]).to have_key(:title)
    end
  end
end
