Rails.application.routes.draw do


  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
}
  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  root to: 'homes#top'
  get '/user/exit' => 'users#exit'
  resources :users, only: [:show, :edit, :update, :destroy] do
    member do
    get "exit"
    patch "withdraw"
    end

    resources :day_weights
  end

  resources :posts do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  get 'about' => 'homes#about'

  namespace :admins do
    resources :users, only: [:show, :edit, :update, :index]
    resources :genres, except: :new
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
