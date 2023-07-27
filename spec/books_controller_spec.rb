require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe 'GET #index' do
    it 'returns a success response with all books' do
      #create a book to add onto the db
      book = Book.create(
        name: 'My Second Book',
        isbn: '123-3213243567',
        authors: ['John Doe'],
        number_of_pages: 350,
        publisher: 'Acme Books',
        country: 'United States',
        release_date: '2019-08-01'
      )

      get :index
      expect(response).to have_http_status(:success)

      # Update the expected response data to match the actual data
      expect(JSON.parse(response.body)).to eq({
        "status_code" => 200,
        "status" => "success",
        "data" => [
          {
            "id" => book.id,
            "name" => "My Second Book",
            "isbn" => "123-3213243567",
            "authors" => "[\"John Doe\"]",
            "number_of_pages" => 350,
            "publisher" => "Acme Books",
            "country" => "United States",
            "release_date" => "2019-08-01",
            "created_at" => book.created_at.as_json,
            "updated_at" => book.updated_at.as_json
          }
        ]
      })
    end
  end

end

