Rails.application.routes.draw do
  resources :comments
  resources :ratings
  resources :seasons
  resources :achievements
  resources :user_achievements
  resources :follows
  resources :views
  resources :shows
  resources :users do
    member do
      post :signin
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  root 'welcome#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
