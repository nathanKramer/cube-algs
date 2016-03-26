Rails.application.routes.draw do
  get '/home', to: 'cube_algs#home', as: :cube_algs_home
  get '/about', to: 'cube_algs#about', as: :cube_algs_about
  get '/cross', to: 'cube_algs#cross', as: :cube_algs_cross
  get '/f2l', to: 'cube_algs#f2l', as: :cube_algs_f2l
  get '/oll', to: 'cube_algs#oll', as: :cube_algs_oll
  get '/pll', to: 'cube_algs#pll', as: :cube_algs_pll

  resources :algorithms
  resources :cases, only: [:index, :show, :edit, :update]
  root 'cube_algs#home'
end
