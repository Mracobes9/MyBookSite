Rails.application.routes.draw do
  get 'favorite_books/create'
  get 'favorite_books/destroy'

  devise_for :users
  get 'catalog' => 'static_pages#catalog'
  root 'static_pages#home'
  resources :users, only: [:show]
  resources :books, only: [:show]
  resources :comments, only:[:create, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
