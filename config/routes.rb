Rails.application.routes.draw do
  root "users#index"
  devise_for :users, controllers: { sessions: 'users/sessions' }
  get 'posts/index'
  get 'users/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
 
  resources :users do
    resources :posts do
      resources :comments
      resources :likes
    end
  end
end