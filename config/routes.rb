Rails.application.routes.draw do
  get 'sessions/new'

  root to: 'blogs#top'
  get '/top', to: 'blogs#top'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions
end
