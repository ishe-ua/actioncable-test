# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'

  resources :sessions, only: %i[new create]
  resources :chats, only: %i[index show create]
end
