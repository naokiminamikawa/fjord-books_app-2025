Rails.application.routes.draw do
  devise_for :users

  resources :books
  resources :users, only: [:index, :show]

  root "users#index"

  get "up" => "rails/health#show", as: :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine,
      at: "/letter_opener"
  end
end
