class ForecastSerializer
  class << self
    def weather(data)
      {
        data: {
          id: nil,
          type: 'forecast',
          attributes: {
            current_weather: {
              datetime: Time.at(data[:current][:dt]).strftime("%F %T"),
              sunrise: Time.at(data[:current][:sunrise]).strftime("%F %T"),
              sunset: Time.at(data[:current][:sunset]).strftime("%F %T"),
              temperature: data[:current][:temp],
              feels_like: data[:current][:feels_like],
              humidity: data[:current][:humidity],
              uvi: data[:current][:uvi],
              visibility: data[:current][:visibility],
              conditions: data[:current][:weather][0][:description],
              icon: data[:current][:weather][0][:icon]
            },
            daily_weather: daily_weather(data[:daily]),
            hourly_weather: hourly_weather(data[:hourly])
          }
        }
      }
    end

    def daily_weather(data)
      [*0..4].map do |num|
        {
          date: Time.at(data[num][:dt]).strftime("%F"),
          sunrise: Time.at(data[num][:sunrise]).strftime("%F %T"),
          sunset: Time.at(data[num][:sunset]).strftime("%F %T"),
          max_temp: data[num][:temp][:max],
          min_temp: data[num][:temp][:min],
          conditions: data[num][:weather][0][:description],
          icon: data[num][:weather][0][:icon]
        }
      end
    end

    def hourly_weather(data)
      [*0..7].map do |num|
        {
          time: Time.at(data[num][:dt]).strftime("%T"),
          temperature: data[num][:temp],
          conditions: data[num][:weather][0][:description],
          icon: data[num][:weather][0][:icon]
        }
      end
    end
  end
end
