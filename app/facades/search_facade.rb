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

    def find_books(location, quantity)
      result = BookService.get_books(location, quantity)
      current_weather = SearchFacade.find_weather(location).current_weather

      book = Book.new(result, location, current_weather, quantity)
    end
  end
end
