Rails.application.routes.draw do
  get 'buyer/page'
  resources :vinyls
  resources :profiles
  devise_for :users
  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
