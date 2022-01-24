class Api::V1::BooksController < ApplicationController
  def index
    if params[:quantity].to_i == 0
      render json: {errors: {details: "Quantity cannot be zero."}}, status: 401
    else
      book = SearchFacade.find_books(params[:location], params[:quantity])

      current_weather = SearchFacade.find_weather(params[:location])

      render json: BookSerializer.books(book, params[:location], current_weather, params[:quantity])
    end
  end
end
