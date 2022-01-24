class BookSerializer
  class << self
    def books(data, location, weather, quantity)
      { id: nil,
        type: "books",
        attributes: {
          total_books_found: data[:numFound],
          destination: location,
          current_weather:{
            summary: weather[:current][:weather][0][:description],
            temperature: weather[:current][:temp]
          },
          books: book_data_items(data, quantity)
        }
      }
    end

    def book_data_items(book_data, book_quantity)
      book_data.first(book_quantity.to_i).map do |book|
        {
          isbn: book_data[:docs][0][:isbn],
          title: book_data[:docs][0][:title],
          publisher: book_data[:docs][0][:publisher]
        }
      end
    end
  end
end
