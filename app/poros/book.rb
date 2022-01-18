class Book
  attr_reader :id,
              :type,
              :total_books_found,
              :books

  def initialize(data)
    @id = nil
    @type = "books"
    @total_books_found = data[:numFound]
    @books = data[:docs].map do |book|
      {isbn: book[:isbn],
      title: book[:title],
      publisher: book[:publisher]}
    end
  end

  def destination(location)
    MapService.locations(location)
  end

  def forecast
    SearchFacade.get_weather(
  end
end
