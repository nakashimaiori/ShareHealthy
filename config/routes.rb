Rails.application.routes.draw do


  get 'relationships/create'
  get 'relationships/destroy'
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
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member

    member do
    get "exit"
    patch "withdraw"
    end

    resources :day_weights
  end

  resources :tags do
    get 'posts', to: 'posts#tagsearch'
  end

  resources :posts do
    get 'search/:id' => 'posts#search', as: 'search', on: :collection
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
