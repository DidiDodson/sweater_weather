require 'rails_helper'

RSpec.describe SearchFacade do
  it 'finds weather by a location' do
    location = 'Denver, CO'

    result = SearchFacade.find_weather(location)

    expect(result).to be_a(Forecast)
    expect(result.current_weather).to be_a(Hash)
    expect(result.daily_weather.first).to have_key(:date)
    expect(result.hourly_weather.first).to have_key(:conditions)
  end

  it 'finds images by search term' do
    search_term = 'Denver skyline'

    result = SearchFacade.find_images(search_term)

    expect(result.first).to be_a(Background)
    expect(result.first.image).to have_key(:description)
    expect(result.first.image).to have_key(:credit)
  end

  it 'gets books by location search' do
    search_term = 'Denver, CO'

    result = SearchFacade.find_books(search_term)

    expect(result).to be_a(Book)
  end
end
