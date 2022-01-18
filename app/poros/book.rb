class Book
  attr_reader :id,
              :type,
              :destination,
              :current_weather,
              :total_books_found,
              :books

  def initialize(data, location, current_weather, quantity)
#ran out of time to finish the quantity portion. Tried using .take(quantity) in the @books block, but didn't quite finish
    @id = nil
    @type = "books"
    @total_books_found = data[:numFound]
    @destination = location
    @current_weather = {
      summary: current_weather[:conditions],
      temperature: current_weather[:temperature]}
    @books = data[:docs].take(quantity.to_i).map do |book|
      {isbn: book[:isbn],
      title: book[:title],
      publisher: book[:publisher]}
    end
  end
end
