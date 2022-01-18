require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    it 'accesses book service' do
      location = 'Denver, CO'

      result = BookService.get_books(location)

      expect(result).to have_key(:numFound)
      expect(result[:docs][0]).to have_key(:title)
    end
  end
end
