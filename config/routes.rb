Rails.application.routes.draw do
  root 'groups#index'

  get '/createGroup', to: 'groups#index'

  resources :groups, only: :index do
    collection do
      get :createGroup
    end
  end
  
end
