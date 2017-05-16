Rails.application.routes.draw do

  root 'sender#index'

  resources :sender

  resources :sender_user

  resources :messages

  post '/366674849:AAH2xDCGrXohH3RaWAMfzeoVggJceNbPFTA' => 'application#webhook'
end
