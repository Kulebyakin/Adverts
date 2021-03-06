Rails.application.routes.draw do
  namespace :admin do
    root to: 'adverts#index'
    get 'adverts/:id/accept', to: 'adverts#accept', as: :accept_advert
    get 'adverts/:id/reject', to: 'adverts#reject', as: :reject_advert
    get 'moderate', to: 'adverts#moderate', as: :moderate
    resources :adverts, only: %i[ index show ]
    resources :users, except: :show
    resources :categories, except: :show
    resources :hashtags, except: :show
  end

  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', registration: 'register' }

  root to: 'adverts#index'
  get 'adverts/my_adverts', to: 'adverts#my_adverts', as: :my_adverts
  resources :adverts
  resources :categories, only: :show
  resources :hashtags, only: :show
  get 'adverts/:id/moderate', to: 'adverts#moderate', as: :moderate_advert
  get 'adverts/:id/publish', to: 'adverts#publish', as: :publish_advert
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
