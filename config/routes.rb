Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :organisations, except: %i[new] do
    member do
      get 'join'
      get 'leave'
    end
  end
end
