Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions: "users/sessions",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  resources :origins
  namespace :bank do
    resources :transactions
    resources :statements
    resources :accounts
  end

  resources :wallets, only: [:index, :create, :show]
  resources :variable_incomes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "wallets#index"
end
