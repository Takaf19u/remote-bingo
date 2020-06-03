Rails.application.routes.draw do
  root 'groups#index'

  get '/createGroup', to: 'groups#index'

  resources :groups, only: [:index, :create] do
    collection do
      get :createGroup
    end
  end
  resources :users, only: [:create, :destroy]
  
end
