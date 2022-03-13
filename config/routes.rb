Rails.application.routes.draw do
  get 'rooms/index'
  devise_for :users

  root controller: :rooms, action: :index

  resources :room_messages
  resources :rooms
end
