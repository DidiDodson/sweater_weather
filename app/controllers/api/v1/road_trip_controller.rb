class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_user(params[:api_key])
    if params[:api_key] == "" || user.exists? == false
      render json: {errors: {details: "Incorrect API Key."}}, status: 401
    else
      roadtrip = RoadTripFacade.trip_planner(params)
      
      render json: RoadTripSerializer.trip(roadtrip)
    end
  end
end
