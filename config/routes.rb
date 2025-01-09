Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resources :users, only: [:show] do
    resources :entries
  end

  authenticated :user do
    root "entries#index", as: :authenticated_root
  end

  root "home#index"
  resources :categories, only: [:new, :create]
end
