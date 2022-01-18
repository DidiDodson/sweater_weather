class Book
  attr_reader :id,
              :type,
              :destination,
              :current_weather,
              :total_books_found,
              :books

  def initialize(data, location, current_weather, quantity)
    @id = nil
    @type = "books"
    @total_books_found = data[:numFound]
    @destination = location
    @current_weather = current_weather_hash(current_weather)
    @books = books_array(data[:docs], quantity)
  end

  def current_weather_hash(weather_data)
    {
      summary: weather_data[:conditions],
      temperature: weather_data[:temperature]
    }
  end

  def books_array(book_data, quantity)
    book_data.take(quantity.to_i).map do |book|
      {
        isbn: book[:isbn],
        title: book[:title],
        publisher: book[:publisher]
      }
    end
  end
end
