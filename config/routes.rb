Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/external-books', to: 'book#external_books'
  post '/books', to: 'book#create'
  get '/books', to: 'book#index'
  get '/books/:id', to: 'book#show'
  patch '/books/:id', to: 'book#update'
  delete '/books/:id', to: 'book#destroy'
end
