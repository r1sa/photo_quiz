Rails.application.routes.draw do

  resources :posts

  devise_for :users, controllers: {
      registrations: 'users/registrations',
  }
  get 'users/:id' => 'users#show'
  get 'posts/:id/answer' => 'posts#answer'
  get 'posts/:id/correct_answer' => 'posts#correct_answer'
  get 'posts/:id/wrong_answer' => 'posts#wrong_answer'
  get 'home/index'
  get 'home/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
