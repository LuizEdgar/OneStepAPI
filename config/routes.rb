Rails.application.routes.draw do
  
  resources :opportunities
  resource :me, controller: 'me', only: [:show] do
    get :contacts, :locations, :causes, :skills, :feed, :opportunities
    post :sign_in, :facebook_sign_in, :add_education
  end

  resources :volunteers, only: [:show, :index]
  resources :organizations, only: [:show, :index]
  resources :users
  resources :causes
  resources :skills
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
