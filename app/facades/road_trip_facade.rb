class RoadTripFacade
  class << self
    def trip_planner(params)
      time = MapService.time(params[:origin], params[:destination])

      if time[:routeError][:errorCode] == 2
        roadtrip = {
          origin: params[:origin],
          destination: params[:destination],
          travel_time: "Impossible",
          weather_at_eta: {
            temperature: "",
            conditions: ""}
          }
        RoadTrip.new(roadtrip)
      else
        hours = time[:realTime] / 3600
        travel_time = time[:formattedTime]

        if hours < 24
          lat = MapService.locations(params[:destination])[:latLng][:lat]
          long = MapService.locations(params[:destination])[:latLng][:lng]
          hourly_weather = WeatherService.get_weather(lat, long)[:hourly][hours]

          roadtrip = {
            origin: params[:origin],
            destination: params[:destination],
            travel_time: travel_time,
            weather_at_eta: {
              temperature: hourly_weather[:temp],
              conditions: hourly_weather[:weather][0][:description]}
            }
          RoadTrip.new(roadtrip)
        elsif hours >= 24
          day = hours / 24
          lat = MapService.locations(params[:destination])[:latLng][:lat]
          long = MapService.locations(params[:destination])[:latLng][:lng]
          daily_weather = WeatherService.get_weather(lat, long)[:daily][day]
          roadtrip = {
            origin: params[:origin],
            destination: params[:destination],
            travel_time: travel_time,
            weather_at_eta: {
              temperature: daily_weather[:temp][:day],
              conditions: daily_weather[:weather].first[:description]}
            }
          RoadTrip.new(roadtrip)
        end
      end
    end
  end
end
