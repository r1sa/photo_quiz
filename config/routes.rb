Rails.application.routes.draw do

  resources :posts

  devise_for :users, controllers: {
      registrations: 'users/registrations',
  }
  get 'users/:id' => 'users#show'
  get 'home/index'
  get 'home/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
