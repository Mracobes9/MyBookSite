Rails.application.routes.draw do
  get 'favorite_books/create'
  get 'favorite_books/destroy'
  get 'mycomments' => 'comments#index'

  devise_for :users
  get 'catalog' => 'static_pages#catalog'
  root 'static_pages#home'
  resources :users, only: [:show]
  resources :books, only: [:show, :new, :create] do
    resources :comments, only:[:create, :edit, :destroy, :update]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
