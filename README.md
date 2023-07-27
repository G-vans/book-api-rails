# My Book API

This is a REST API that calls an external API service to get information about books and also perform simple CRUD(Create, Read, Update, Delete) operations on it.

## Getting Started

To get started with the API, follow these instructions:

### Prerequisites

You need to have the following installed on your system:

- Ruby (version 3.0 or higher)
- Rails (version 7.0.6 )

### Installation

1. Clone the repository:

```bash
git clone https://github.com/G-vans/book-api-rails.git
cd book-api-rails
```

2. Install the required gems:
```bash
bundle install
```
3. Create and migrate the database then start the server:
```bash
rails db:create
rails db:migrate
rails s
```
Now the API should be up and running at 'http://localhost:3000'.

## API Endpoints

The following are the available API endpoints:

### Fetch External Books
- Endpoint: GET /external_books
- Params: name (string, required)
- Response: Returns a list of external books matching the given name.

### Create a Book
- Endpoint: POST /books
- Params:
    - name (string, required)
    - isbn (string, required)
    - authors (array of strings, required)
    - number_of_pages (integer, required)
    - publisher (string)
    - country (string)
    - release_date (string in the format "YYYY-MM-DD")
    - Response: Returns the details of the newly created book.

### Get All Books
- Endpoint: GET /books
- Response: Returns a list of all books in the bookstore.

### Get a Specific Book
- Endpoint: GET /books/:id
- Params: id (integer, required)
- Response: Returns the details of the specified book.

### Update a Book
- Endpoint: PATCH /books/:id
- Params: Same as create endpoint
- Response: Returns the updated details of the book.

### Delete a Book
- Endpoint: DELETE /books/:id
- Params: id (integer, required)
- Response: Returns a success message if the book was deleted successfully.

## Error Handling
The API returns appropriate error responses with status codes and error messages in case of any issues with the requests.

### Running Tests
To run the test suite and verify that the API endpoints are functioning as expected, use the following command:

```bash
bundle exec rspec
```

## Contributing
Contributions are welcome! If you find any issues or want to add new features, feel free to create a pull request.
