Rails.application.routes.draw do

  resources :cocktails, only: [:index, :new, :create, :show, :destroy] do
    resources :doses, except: [:show, :destroy]
  end
  resources :doses, only: [:destroy]
  root to: 'cocktails#index'
end
