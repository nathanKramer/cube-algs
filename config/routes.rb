Rails.application.routes.draw do
  resources :wizards, only: [:new, :create, :index]
end
