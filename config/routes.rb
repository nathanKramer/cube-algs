Rails.application.routes.draw do
  get 'cube_algs/home'

  get 'cube_algs/about'

  get 'cube_algs/cross'

  get 'cube_algs/f2l'

  get 'cube_algs/oll'

  get 'cube_algs/pll'

  resources :algorithms
  resources :cases, only: [:index]
  root 'cube_algs#home'
end
