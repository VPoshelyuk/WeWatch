Rails.application.routes.draw do
  resources :watches
  resources :comments
  resources :ratings
  resources :achievements
  resources :user_achievements
  resources :users, only: [:show, :edit, :create, :update, :destroy]
  get '/signup', to: 'users#new', as: 'signup'
  resources :views
  resources :shows
  resources :seasons
  resources :episodes
  resources :follows


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/search' => 'shows#search_shows'
  root 'shows#index'
  # delete 'sessions', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
