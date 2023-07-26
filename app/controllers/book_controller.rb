class BookController < ApplicationController
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
end
