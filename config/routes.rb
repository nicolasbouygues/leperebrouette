Rails.application.routes.draw do
  root to: 'pages#home'
  resources :barrows do
    resources :bookings, only: [:new, :create]
  end
  devise_for :users
  get 'profile', to: 'barrows#my_barrows', as: :my_barrows
  resources :bookings, only: [:edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
