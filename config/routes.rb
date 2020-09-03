Rails.application.routes.draw do
  namespace :admins do
    get 'users/show'
    get 'users/index'
    get 'users/edit'
  end
  root to: 'homes#top'

  devise_for :users, controllers: {
  sessions: 'users/sessions',
  passwords: 'users/passwords',
  registrations: 'users/registrations'
}

  get 'users/show'
  get 'homes/about'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
