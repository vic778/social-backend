Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  scope :api, defaults: { format: :json } do
      devise_for :users, controllers: { sessions: :sessions }, path_names: { sign_in: :login }
      
      resource :user, only: [:update] do
        resources :relationships, only: [:create]
      end
    get 'user/auto_login', to: 'users#auto_login'
    get 'users', to: 'users#index'
    get 'users/:id', to: 'users#show'
    post 'users/:id/relationships', to: 'relationships#create'
    delete 'users/:id/relationships', to: 'relationships#destroy'
      
    resources :posts do
      resources :comments, only: [:create, :destroy] 
      resources :likes, only: [:create, :destroy]
    end
    resources :relationships, only: [:destroy]
  end
end
