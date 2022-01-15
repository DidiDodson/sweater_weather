class SearchFacade
  class << self
    def find_weather(location)
      lat = MapService.locations(location)[:latLng][:lat]
      long = MapService.locations(location)[:latLng][:lng]

      current = WeatherService.get_weather(lat, long)
    end
  end
end
