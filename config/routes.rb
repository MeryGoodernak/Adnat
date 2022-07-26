Rails.application.routes.draw do
  devise_for :users

  root to: "organisations#index"

  resources :organisations, except: %i[new] do
    resources :shifts, except: %i[new show]
    member do
      get 'join'
      get 'leave'
    end
  end
end
