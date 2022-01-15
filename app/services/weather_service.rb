class WeatherService
  class << self
    def get_weather(latitude, longitude)
      conn = Faraday.new(url: 'https://api.openweathermap.org/data/2.5/onecall') do |req|
        req.params['appid'] = ENV['weather_api_key']
        req.params['lat'] = "#{latitude}"
        req.params['lon'] = "#{longitude}"
        req.params['units'] = "imperial"
      end

      response = conn.get

      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
