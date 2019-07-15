Rails.application.routes.draw do

  root 'sessions#home'

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'
  resources :users
  # , only: [:create, :new, :show]
  resources :courses do
    resources :grades
    # , only: [:new, :index, :show, :create]
      # :edit, :show]
  end
  resources :students do
    resources :grades, only: [:show, :index]
  end
  resources :grades
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
