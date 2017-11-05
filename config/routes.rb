Rails.application.routes.draw do
  root 'calculators#index'
  resources :calculators, only: :index do
    post :calculate, on: :collection
    get :calculate, on: :collection
  end
end
