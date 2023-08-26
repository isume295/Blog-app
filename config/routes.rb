Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
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
