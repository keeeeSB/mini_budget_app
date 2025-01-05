Rails.application.routes.draw do

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  authenticated :user do
  end

  root "home#index"
end
