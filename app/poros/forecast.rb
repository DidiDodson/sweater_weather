class Forecast
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(weather_data)
    @id = nil
    @current_weather = current_weather_hash(weather_data[:current])
    @daily_weather = daily_weather_hash(weather_data[:daily])
    @hourly_weather = hourly_weather_hash(weather_data[:hourly])
  end

  def current_weather_hash(weather_data)
    {
      datetime: Time.at(weather_data[:dt]).utc.to_datetime,
      sunrise: Time.at(weather_data[:sunrise]),
      sunset: Time.at(weather_data[:sunset]),
      temperature: weather_data[:temp],
      feels_like: weather_data[:feels_like],
      humidity: weather_data[:humidity],
      uvi: weather_data[:uvi],
      visibility: weather_data[:visibility],
      conditions: weather_data[:weather][0][:description],
      icon: weather_data[:weather][0][:icon]
    }
  end

  def daily_weather_hash(weather_data)
    weather_data.first(5).map do |day|
      {
        date: Time.at(day[:dt]).strftime('%m-%d-%Y'),
        sunrise: Time.at(day[:sunrise]),
        sunset: Time.at(day[:sunset]),
        max_temp: day[:temp][:max],
        min_temp: day[:temp][:min],
        conditions: day[:weather][0][:description],
        icon: day[:weather][0][:icon]
      }
    end
  end

  def hourly_weather_hash(weather_data)
    weather_data.first(8).map do |hour|
      {time: Time.at(hour[:dt]).strftime('%H:%M:%S'),
      temperature: hour[:temp],
      conditions: hour[:weather][0][:description],
      icon: hour[:weather][0][:icon]
      }
    end
  end
end
