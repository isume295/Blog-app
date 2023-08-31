Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  # devise_scope :user do
  #   root to: "devise/sessions#new"
  # end
 
  resources :users do
    resources :posts do
      member do
        post 'like'
        delete 'unlike'
      end
      resources :comments
      resources :likes
    end
  end  
  resources :likes, only: [:create, :destroy]
end
