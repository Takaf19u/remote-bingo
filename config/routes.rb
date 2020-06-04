Rails.application.routes.draw do
  # デバイスのルーティングをカスタマイズ
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  root 'groups#index'

  get '/createGroup', to: 'groups#index'

  resources :groups, only: [:index, :create] do
    collection do
      get :createGroup
    end
  end
  
end
