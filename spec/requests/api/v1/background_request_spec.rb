require 'rails_helper'

describe "Background image API" do
  it "gets an image for a specific term" do
    search_term = 'Denver skyline'
    get "/api/v1/backgrounds?query=#{search_term}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result.first[:id]).to eq(nil)
    expect(result.first[:type]).to eq('background')
    expect(result.first[:attributes][:image]).to have_key(:description)
    expect(result.first[:attributes][:image]).to_not have_key(:color)
    expect(result.first[:attributes][:image]).to have_key(:image_url)
    expect(result.first[:attributes][:image]).to have_key(:credit)
    expect(result.first[:attributes][:image][:credit]).to_not have_key(:username)
    expect(result.first[:attributes][:image][:credit]).to have_key(:author)
    expect(result.first[:attributes][:image][:credit][:hosted_on]).to eq('Unsplash')
  end
end
