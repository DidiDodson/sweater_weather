class SearchFacade
  class << self
    def find_weather(location)
      lat = MapService.locations(location)[:latLng][:lat]
      long = MapService.locations(location)[:latLng][:lng]

      current = WeatherService.get_weather(lat, long)

      Forecast.new(current)
    end

    def find_images(term)
      results = BackgroundService.images(term)[:results]

      results.map do |result|
        Background.new(result)
      end
    end

    def find_books(location)
      result = BookService.get_books(location)

      book = Book.new(result)
    end
  end
end
