class Forecast
  attr_reader :id,
              :current_weather,
              :daily_weather,
              :hourly_weather

  def initialize(data)
    @id = nil
    @current_weather = {
      datetime: Time.at(data[:current][:dt]).utc.to_datetime,
      sunrise: Time.at(data[:current][:sunrise]),
      sunset: Time.at(data[:current][:sunset]),
      temperature: data[:current][:temp],
      feels_like: data[:current][:feels_like],
      humidity: data[:current][:humidity],
      uvi: data[:current][:uvi],
      visibility: data[:current][:visibility],
      conditions: data[:current][:weather][0][:description],
      icon: data[:current][:weather][0][:icon]
      }
    @daily_weather =
      data[:daily].take(5).map do |day|
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
    @hourly_weather =
      data[:hourly].take(8).map do |hour|
        {time: Time.at(hour[:dt]).strftime('%H:%M:%S'),
        temperature: hour[:temp],
        conditions: hour[:weather][0][:description],
        icon: hour[:weather][0][:icon]
        }
      end
  end
end
