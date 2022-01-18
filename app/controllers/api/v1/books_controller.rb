class Api::V1::BooksController < ApplicationController
  def index
    book = SearchFacade.find_books(params[:q], params[:limit])
    render json: BookSerializer.new(book)
  end
end
