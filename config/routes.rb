Rails.application.routes.draw do
  resources :barrows
  devise_for :users
  root to: 'pages#home'
  get 'my_barrows', to: 'barrows#my_barrows', as: :my_barrows
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
