class Api::V1::ForecastController < ApplicationController
  def index
    forecast = SearchFacade.find_weather(params[:location])

    render json: ForecastSerializer.weather(forecast)
  end
end
