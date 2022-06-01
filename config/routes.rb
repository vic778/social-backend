Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
      
      resource :user, only: [:update] do
      get 'user/auto_login', to: 'users#auto_login'
      get 'users', to: 'users#index'
       resources :relationships, only: [:create]
      end
      
    resources :posts do
      resources :comments, only: [:create, :destroy] 
      resources :likes, only: [:create, :destroy]
    end
    resources :relationships, only: [:destroy]
  end
end
