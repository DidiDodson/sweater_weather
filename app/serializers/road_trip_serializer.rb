class RoadTripSerializer
  class << self
    def trip(data)
      {
        data: {
          id: nil,
          type: 'road_trip',
          attributes: {
            start_city: data.start_city,
            end_city: data.end_city,
            travel_time: data.travel_time,
            weather_at_eta: {
                        temperature: data.weather_at_eta[:temperature],
                        conditions: data.weather_at_eta[:conditions]
                      }
          }
        }
      }
    end
  end
end
