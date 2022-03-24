Rails.application.routes.draw do

  get 'new' => "books#new"
  
  get 'books' => "books#index"
  
  post 'books' => "books#create" # /booksで保存するときはcreateアクション
  
  get 'books/:id' => "books#show", as: "book" # 'book'という名前のアクション
  
  get 'books/edit'
  
  get '/' => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

