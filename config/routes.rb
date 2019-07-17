Rails.application.routes.draw do
  get 'buyer/page'
  resources :vinyls
  resources :profiles
  devise_for :users
  root 'home#index'

  resources :sellers do
    resources :reviews, only: [:new, :create]
  end
    post '/payment', to:"buyer#payment"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
