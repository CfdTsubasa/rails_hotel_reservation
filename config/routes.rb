Rails.application.routes.draw do
  get 'pages/home'
  get 'reservations/new'
  get 'reservations/index'
  get 'reservations/show'
  post 'reservations/confirm'
  get 'reservations/create'
  post 'reservations/back'
  post 'reservations/complete'

  get 'users/new'
  get 'users/modify'
  post 'users/profile'
  get 'rooms/index'
  get 'rooms/search'

  post 'reserve/confirm' # 確認画面

  # devise_for :users

  resources :rooms
  resources :reservations
  Rails.application.routes.draw do
  get 'pages/home'
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  end
  resources :users

  devise_scope :user do
    root to: 'users/sessions#new'
  end
end
