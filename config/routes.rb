GimmeABreak::Application.routes.draw do
  resources :users, only: [:show]
  
  match 'auth/:provider/callback', to: 'sessions#create', as: 'callback', via: [:get, :post]
  get 'auth/failure', to: "sessions#failure"
  get 'signout', to: 'sessions#destroy', as: 'signout', via: [:delete]
  
  root to: "application#home"
end
