GimmeABreak::Application.routes.draw do
  resources :users
  
  get 'auth/:provider/callback', to: 'sessions#create', as: 'callback'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout', via: [:delete]
  
  root to: "application#home"
end
