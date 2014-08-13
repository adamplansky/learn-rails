Rails.application.routes.draw do
#  post 'contact', to: 'contacts#process_form'
  resources :contacts, only: [:new, :create]
  resources :visitors, only: [:new, :create]
  root to: 'visitors#new'
end