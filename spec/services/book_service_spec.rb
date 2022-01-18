require 'rails_helper'

RSpec.describe BookService do
  describe 'class methods' do
    it 'accesses book service' do
      location = 'Denver, CO'
      quantity = 5

      result = BookService.get_books(location, quantity)

      expect(result).to have_key(:numFound)
      expect(result[:docs][0]).to have_key(:title)
    end
  end
end
