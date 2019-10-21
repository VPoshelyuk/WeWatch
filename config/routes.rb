Rails.application.routes.draw do
  resources :follows
  resources :views
  resources :shows
  resources :users do
    member do
      post :signin
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
