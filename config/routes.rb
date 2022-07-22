Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :organisations, except: %i[new] do
    get 'join', on: :member
    get 'leave', on: :collection
  end
end
