Rails.application.routes.draw do
  
  resource :me, controller: 'me', only: [:show] do
    post :sign_in, :facebook_sign_in, :add_education
  end

  resources :volunteers, only: [:index]
  resources :organizations, except: [:create, :destroy]
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
