Rails.application.routes.draw do
  
  get 'books' => "books#index"
  
  post 'books' => "books#create" # /booksで保存するときはcreateアクション
  
  get 'books/:id' => "books#show", as: "book" # 'book'という名前のアクション
  
  get 'books/:id/edit' => 'books#edit', as: "edit_book"
  
  patch 'books/:id' => "books#update" , as: "update_book" # 更新
  
  delete 'books/:id' => "books#destroy", as: "destroy_book" # 削除
  
  get '/' => "homes#top"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

