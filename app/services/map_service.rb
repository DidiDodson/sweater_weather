class MapService
  class << self
    def locations(location)
      conn = Faraday.new(url: 'http://www.mapquestapi.com')

      result = conn.get('geocoding/v1/address') do |req|
        req.params['key'] = ENV['mapquest_api_key']
        req.params['location'] = "#{location}"
      end
      JSON.parse(result.body, symbolize_names: true)[:results][0][:locations][0]
    end

    def time(start_city, end_city)
      conn = Faraday.new('http://www.mapquestapi.com')

      result = conn.get('directions/v2/route') do |req|
        req.params['key'] = ENV['mapquest_api_key']
        req.params['from'] = "#{start_city}"
        req.params['to'] = "#{end_city}"
      end

      JSON.parse(result.body, symbolize_names: true)[:route]
    end
  end
end
