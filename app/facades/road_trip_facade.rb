class RoadTripFacade
  class << self
    def trip_planner(params)
      time = MapService.time(params[:origin], params[:destination])

      if time[:routeError][:errorCode] == 2
        impossible_trip(params)
      else
        hours = time[:realTime] / 3600
        travel_time = time[:formattedTime]
        if hours < 24
          trip_less_than_24_hours(params, hours, travel_time)
        elsif hours >= 24
          trip_more_than_24_hours(params, hours, travel_time)
        end
      end
    end

    def impossible_trip(query_params)
      roadtrip = {
        origin: query_params[:origin],
        destination: query_params[:destination],
        travel_time: "Impossible",
        weather_at_eta: {
          temperature: "",
          conditions: ""}
        }
      RoadTrip.new(roadtrip)
    end

    def trip_less_than_24_hours(query_params, hours, travel_time)
      lat = MapService.locations(query_params[:destination])[:latLng][:lat]
      long = MapService.locations(query_params[:destination])[:latLng][:lng]
      hourly_weather = WeatherService.get_weather(lat, long)[:hourly][hours]

      roadtrip = {
        origin: query_params[:origin],
        destination: query_params[:destination],
        travel_time: travel_time,
        weather_at_eta: {
          temperature: hourly_weather[:temp],
          conditions: hourly_weather[:weather][0][:description]}
        }
      RoadTrip.new(roadtrip)
    end

    def trip_more_than_24_hours(query_params, hours, travel_time)
      day = hours / 24
      lat = MapService.locations(query_params[:destination])[:latLng][:lat]
      long = MapService.locations(query_params[:destination])[:latLng][:lng]
      daily_weather = WeatherService.get_weather(lat, long)[:daily][day]
      roadtrip = {
        origin: query_params[:origin],
        destination: query_params[:destination],
        travel_time: travel_time,
        weather_at_eta: {
          temperature: daily_weather[:temp][:day],
          conditions: daily_weather[:weather].first[:description]}
        }
      RoadTrip.new(roadtrip)
    end
  end
end
