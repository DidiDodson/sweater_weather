class Api::V1::BooksController < ApplicationController
  def index
    if params[:quantity].to_i == 0
      render json: {errors: {details: "Quantity cannot be zero."}}, status: 401
    else
      book = SearchFacade.find_books(params[:location], params[:quantity])
      render json: BookSerializer.new(book)
    end
  end
end
