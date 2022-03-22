Rails.application.routes.draw do

  require 'sidekiq/web'
  Sidekiq::Web.set :sessions, false
  mount Sidekiq::Web => '/sidekiq'

  get 'rooms/index'
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms
end
