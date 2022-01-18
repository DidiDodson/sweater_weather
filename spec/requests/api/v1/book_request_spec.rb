require 'rails_helper'

describe "Book API" do
  it "happy path - gets search data for a specific term" do
    search_term = 'Denver, CO'
    quantity = 2
    get "/api/v1/book-search?location=#{search_term}&quantity=#{quantity}"

    expect(response).to be_successful
    expect(response.status).to eq(200)

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(result[:id]).to eq(nil)
    expect(result[:type]).to eq('books')
    expect(result[:attributes][:destination]).to eq(search_term)
    expect(result[:attributes][:current_weather]).to have_key(:summary)
    expect(result[:attributes][:current_weather]).to have_key(:temperature)
    expect(result[:attributes]).to have_key(:total_books_found)
    expect(result[:attributes][:books]).to be_an(Array)
    expect(result[:attributes][:books].count).to eq(2)
    expect(result[:attributes][:books].first).to be_a(Hash)
    expect(result[:attributes][:books].first).to have_key(:isbn)
    expect(result[:attributes][:books].first).to have_key(:title)
    expect(result[:attributes][:books].first).to have_key(:publisher)
  end

  xit "sad path - gets search data for a specific term" do
    search_term = 'Denver, CO'
    quantity = 0
    get "/api/v1/book-search?location=#{search_term}&quantity=#{quantity}"

    expect(response).to_not be_successful
    expect(response.status).to eq(401)
  end
end
