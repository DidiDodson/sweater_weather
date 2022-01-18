class BookSerializer
  include JSONAPI::Serializer

  set_id nil
  set_type "books"

  attributes :forecast, :total_books_found, :books

  def forecast
    ForecastSerializer.new(params[:q])
  end
end
