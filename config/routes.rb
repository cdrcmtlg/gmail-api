Rails.application.routes.draw do
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/mail/:uid/', to: 'mails#show', as: 'mail'
  post '/send', to: 'mails#send_mail', as: 'send_mail'
  resources :mails, except: [:show]
  
  root "sessions#index"
end
