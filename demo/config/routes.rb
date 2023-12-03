# frozen_string_literal: true

Rails.application.routes.draw do
  root 'top#index'

  resources :issuance_requests, only: %i[index new create]
  resources :payment_requests, only: %i[index new]
  resources :withdrawal_requests, only: %i[index new]

  resources :transactions, only: %i[index show]
end
