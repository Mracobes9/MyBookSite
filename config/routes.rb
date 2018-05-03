Rails.application.routes.draw do
  devise_for :users
  get 'catalog' => 'static_pages#catalog'
  root 'static_pages#home'
  resources :users, only: [:show]
  resources :books, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
