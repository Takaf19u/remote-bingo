Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'

  get '/createGroup', to: 'groups#index'

  resources :groups, only: [:index, :create] do
    collection do
      get :createGroup
    end
  end
  
end
