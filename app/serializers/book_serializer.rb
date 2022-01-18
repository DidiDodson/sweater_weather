class BookSerializer
  include JSONAPI::Serializer

  set_id nil
  set_type "books"

  attributes :destination, :current_weather, :total_books_found, :books
end
