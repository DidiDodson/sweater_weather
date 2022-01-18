class BookService
  class << self
    def get_books(location)
      conn = Faraday.new(url: 'https://openlibrary.org')

      result = conn.get("search.json?q=#{location}") do |req|
        req.params['q'] = "#{location}"
      end

      JSON.parse(result.body, symbolize_names: true)
    end
  end
end
