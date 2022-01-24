require 'rails_helper'

RSpec.describe SearchFacade do
  it 'finds weather by a location' do
    location = 'Denver, CO'

    result = SearchFacade.find_weather(location)

    expect(result[:current]).to be_a(Hash)
    expect(result[:hourly].first).to have_key(:temp)
  end

  it 'finds images by search term' do
    search_term = 'Denver skyline'

    result = SearchFacade.find_images(search_term)

    expect(result.first).to have_key(:description)
    expect(result.first).to have_key(:urls)
  end

  it 'gets books by location search' do
    search_term = 'Denver, CO'
    quantity = 5

    result = SearchFacade.find_books(search_term, quantity)

    expect(result).to have_key(:numFound)
    expect(result[:docs]).to be_an(Array)
    expect(result[:docs][0]).to have_key(:isbn)
  end
end
