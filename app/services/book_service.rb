class BookService
  class << self
    def get_books(location, num)
      conn = Faraday.new(url: 'https://openlibrary.org')

      result = conn.get("search.json?q=#{location}&limit=#{num}") do |req|
        req.params['q'] = "#{location}"
        req.params['limit'] = "#{num}"
      end

      JSON.parse(result.body, symbolize_names: true)
    end
  end
end
