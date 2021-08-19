Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', registration: 'register' }

  root to: 'adverts#index'
  resources :adverts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
