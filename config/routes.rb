Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :pokemons, only: [:index, :show] do
    member do
      get 'checkout'
      post 'buy'
      post 'sell'
    end
  end

  resource :me, only: [:show] do
    collection do
      get 'add'
      patch 'add', to: 'me#update'
      get 'transactions'
    end
  end
end
