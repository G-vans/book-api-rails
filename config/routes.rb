Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/external-books', to: 'books#external_books'
  resources :books
  # post '/books', to: 'book#create'
  # get '/books', to: 'book#index'
  # get '/books/id', to: 'books#show'
  # patch '/books/:id', to: 'book#update'
  # delete '/books/:id', to: 'book#destroy'
  get '/books/search', to: 'books#search'
end
