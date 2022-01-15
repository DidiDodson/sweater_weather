class BackgroundService
  class << self
    def conn
      Faraday.new(url: 'https://api.unsplash.com') do |f|
        f.params["client_id"] = ENV["unsplash_api_key"]
      end
    end

    def images(search_term)
      result = conn.get('search/photos') do |req|
        req.params['query'] = "#{search_term}"
      end

      JSON.parse(result.body, symbolize_names: true)
    end
  end
end
