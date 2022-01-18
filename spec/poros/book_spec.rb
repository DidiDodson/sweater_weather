require 'rails_helper'

RSpec.describe Book do
  it 'exists with attributes' do
   # let(:data) do
   @data = {
    "numFound": 652,
    "start": 0,
    "numFoundExact": true,
    "docs": [
        {
            "key": "/works/OL8503198W",
            "type": "work",
            "seed": [
                "/books/OL10909613M",
                "/works/OL8503198W",
                "/authors/OL2843451A"
            ],
            "title": "Denver, Co",
            "title_suggest": "Denver, Co",
            "has_fulltext": false,
            "edition_count": 1,
            "edition_key": [
                "OL10909613M"
            ],
            "publish_date": [
                "January 2001"
            ],
            "publish_year": [
                2001
            ],
            "first_publish_year": 2001,
            "isbn": [
                "9780762507849",
                "0762507845"
            ],
            "last_modified_i": 1338943517,
            "ebook_count_i": 0,
            "publisher": [
                "Universal Map Enterprises"
            ],
            "language": [
                "eng"
            ],
            "author_key": [
                "OL2843451A"
            ],
            "author_name": [
                "Universal Map"
            ],
            "publisher_facet": [
                "Universal Map Enterprises"
            ],
            "_version_": 1715096877364412420,
            "author_facet": [
                "OL2843451A Universal Map"
            ]
        }]},
        @destination = "Denver, CO",
        @current_weather = {:datetime=>'Tue, 18 Jan 2022 18:19:49 +0000',
                      :sunrise=>'2022-01-18 07:17:46 -0700',
                      :sunset=>'2022-01-18 17:02:38 -0700',
                       :temperature=>45.86,
                       :feels_like=>45.86,
                       :humidity=>36,
                       :uvi=>1.15,
                       :visibility=>10000,
                       :conditions=>"overcast clouds",
                       :icon=>"04d"},
                       @quantity = 5

    @book =  Book.new(@data.first, @destination, @current_weather, @quantity)

    expect(@book).to be_a(Book)
    expect(@book.books[0]).to have_key(:isbn)
    expect(@book.books[0]).to have_key(:title)
    expect(@book.books[0]).to have_key(:publisher)
  end
end
