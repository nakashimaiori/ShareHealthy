Rails.application.routes.draw do
  get 'rooms/show'
  # get 'day_records/show'
  # get 'day_records/new'
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }

  root to: 'homes#top'
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  get '/user/exit' => 'users#exit'
  resources :chats, only: [:create, :show]
  resources :rooms, only: [:create, :show]
  get 'favorite/:id' => 'users#favorite', as: 'favorite'
  get 'mychat/:id' => 'users#mychat', as: 'mychat'

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member

    member do
      get "exit"
      # patch "withdraw"
    end

    resources :day_weights, except: :show
    resources :day_records, except: :index
  end

  resources :tags do
    get 'posts', to: 'posts#tagsearch'
  end
  get 'select' => 'posts#select'
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
