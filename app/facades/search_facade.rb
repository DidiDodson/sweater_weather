class SearchFacade
  class << self
    def find_weather(location)
      lat = MapService.locations(location)[:latLng][:lat]
      long = MapService.locations(location)[:latLng][:lng]

      current = WeatherService.get_weather(lat, long)
    end

    def find_images(term)
      results = BackgroundService.images(term)[:results]
    end

    def find_books(location, limit)
      result = BookService.get_books(location, limit)
    end
  end
end
