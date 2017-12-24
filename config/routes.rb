# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'

  resources :sessions, only: %i[new create]

  get 'chats/index', as: :chats
  get 'chats/show/:user_id', to: 'chats#show', as: :chat
end
