Rails.application.routes.draw do
  root to: 'blogs#top'
  
  resources :feeds
  resources :contacts
  
  get '/top', to: 'blogs#top'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users
  resources :sessions
  resources :favorites, only:[:create, :destroy]
  
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
