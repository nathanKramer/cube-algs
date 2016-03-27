Rails.application.routes.draw do
  get '/home', to: 'cube_algs#home', as: :cube_algs_home
  get '/about', to: 'cube_algs#about', as: :cube_algs_about
  get '/cross', to: 'cube_algs#cross', as: :cube_algs_cross
  get '/f2l', to: 'cases#f2l', as: :cases_f2l
  get '/oll', to: 'cases#oll', as: :cases_oll
  get '/pll', to: 'cases#pll', as: :cases_pll

  resources :algorithms
  resources :cases, only: [:index, :show, :edit, :update]
  root 'cube_algs#home'
end
