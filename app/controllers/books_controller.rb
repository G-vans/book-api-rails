class BooksController < ApplicationController
    require 'httparty'

    #Req 1 fetch external books via name of a book params
    def external_books
        name_of_book = params[:name]
        response = HTTParty.get("https://www.anapioficeandfire.com/api/books", query: { name: name_of_book })
        data = JSON.parse(response.body)
        #lets check if there are results, if so define how it would be displayed
        if data.present?
            books = data.map do |book|
              {
                name: book['name'],
                isbn: book['isbn'],
                authors: book['authors'],
                number_of_pages: book['numberOfPages'],
                publisher: book['publisher'],
                country: book['country'],
                release_date: book['released'],
              }
            end
            render json: { status_code: 200, status: 'success', data: books }
        else
            render json: { status_code: 404, status: 'not found', data: [] }
        end
    end

    #Req 2 Create a book and save in db
    def create
        book = Book.new(book_params)

        if book.save 
            render json: {status_code: 201, status: 'success', data: { book: book } }
        else
            render json: {status_code: 400, status: 'bad request', errors: book.errors.full_messages }
        end
    end

    #Read: return a list of all books saved
    def index
        books = Book.all
        render json: {status_code: 200, status: 'success', data: books }
    end

    #Show specific book by id
    def show
      book = Book.find_by(id: params[:id])
        if book
          render json: { status_code: 200, status: 'success', data: book }
        else
          render json: { status_code: 404, status: 'not found', data: {} }
        end
    end

    #Update a specific book
    def update
        book = Book.find_by(id: params[:id])
        if book
          if book.update(book_params)
            render json: { status_code: 200, status: 'success', message: "The book #{book.name} was updated successfully", data: book }
          else
            render json: { status_code: 400, status: 'bad request', errors: book.errors.full_messages }
          end
        else
          render json: { status_code: 404, status: 'not found', data: {} }
        end
    end

    #Delete: destroy a specific book
    def destroy
        book = Book.find_by(id: params[:id])
        if book
            book.destroy
            render json: {status_code: 204, status: 'success', message: "The book '#{book.name}' was deleted successfully", data: {}}
        else
            render json: {status_code: 404, status: 'not found', data: {}}
        end
    end

    #Implement search
    def search
      name = params[:name]
      country = params[:country]
      publisher = params[:publisher]
      release_date = params[:release_date]

      books = Book.where("name LIKE ?", "%#{name}%") if name.present?
      books = books.where(country: country) if country.present?
      books = books.where(publisher: publisher) if publisher.present?
      books = books.where(release_date: release_date) if release_date.present?

      if books.present?
        render json: { status_code: 200, status: 'success', data: books }
      else
        render json: { status_code: 404, status: 'not found', data: [] }
      end
    end

    private
    def book_params
        params.permit(:name, :isbn, :number_of_pages, :publisher, :country, :release_date, :authors => [])
    end
end
