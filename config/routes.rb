Rails.application.routes.draw do
  resources :wizards
  root 'wizards#index'
end
