Rails.application.routes.draw do
  resources :wizards, except: [:destroy, :show]
  root 'wizards#index'
end
