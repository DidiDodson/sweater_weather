class Book
  attr_reader :id,
              :type,
              :destination,
              :current_weather,
              :total_books_found,
              :books

  def initialize(data, location, current_weather)
    @id = nil
    @type = "books"
    @total_books_found = data[:numFound]
    @destination = location
    @current_weather = {
      summary: current_weather[:conditions],
      temperature: current_weather[:temperature]}
    @books = data[:docs].map do |book|
      {isbn: book[:isbn],
      title: book[:title],
      publisher: book[:publisher]}
    end
  end
end
