Rails.application.routes.draw do
  resources :feeds
  resources :contacts

  root to: 'blogs#top'
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
