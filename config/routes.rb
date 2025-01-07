Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  devise_scope :user do
    resources :users, only: [] do
      resources :entries
    end
  end

  authenticated :user do
  end

  root "home#index"
  resources :categories, only: [:create, :update]
end
