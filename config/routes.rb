Rails.application.routes.draw do
  root 'calculators#index'
  resources :calculators, only: :index do
    get :calculate, on: :collection
  end
end
