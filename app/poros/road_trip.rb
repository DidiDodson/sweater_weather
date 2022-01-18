class RoadTrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :weather_at_eta

  def initialize(data)
    @id = nil
    @start_city = data[:origin]
    @end_city = data[:destination]
    @travel_time = data[:travel_time]
    @weather_at_eta = weather_hash(data[:weather_at_eta])
  end

  def weather_hash(weather_data)
    {
      temperature: weather_data[:temperature],
      conditions: weather_data[:conditions]
    }
  end
end
