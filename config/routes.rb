Rails.application.routes.draw do

  root 'groups#index'
  get '/createGroup', to: 'groups#index'
  get '/users/sign_up', to: 'groups#index'
  get '/users/sign_in', to: 'groups#index'
  get '/main', to: 'groups#index'
  get '/groups/:group_id/cards/:id', to: 'groups#index'
  

  # デバイスのルーティングをカスタマイズ
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  resources :groups, only: [:index, :create, :update] do
    member do
      get :rands
    end
    resources :cards, only: [ :show ]
  end

  resources :cards, only: [ :create, :update]

end
