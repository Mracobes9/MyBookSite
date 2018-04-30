Rails.application.routes.draw do
  get 'catalog' => 'static_pages#catalog'
  root 'static_pages#home'
  get 'signup' => 'static_pages#home'
  get 'signin' => 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
