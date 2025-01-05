Rails.application.routes.draw do
  get 'homes/index'

  devise_for :users

  authenticated :user do
  end

  root "home#index"
end
