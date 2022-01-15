require 'rails_helper'

RSpec.describe SearchFacade do
  it 'finds weather by a location' do
    location = 'Denver, CO'

    result = SearchFacade.find_weather(location)

    expect(result[:lat]).to eq(39.7385)
    expect(result[:lon]).to eq(-104.9849)
  end
end
