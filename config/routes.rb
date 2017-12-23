# frozen_string_literal: true

Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: %i[new create]
end
