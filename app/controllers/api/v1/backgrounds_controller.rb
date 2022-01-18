class Api::V1::BackgroundsController < ApplicationController
  def index
    image = SearchFacade.find_images(params[:location])

    render json: BackgroundSerializer.new(image)
  end
end
