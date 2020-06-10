Rails.application.routes.draw do

  root 'groups#index'
  get '/createGroup', to: 'groups#index'
  get '/users/sign_up', to: 'groups#index'
  get '/users/sign_in', to: 'groups#index'
  get '/main', to: 'groups#index'
  get '/createGroup/:id', to: 'groups#index'
  

  # デバイスのルーティングをカスタマイズ
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :groups, only: [:index, :create] do
    collection do
      get :createGroup
    end
  end
  
end
