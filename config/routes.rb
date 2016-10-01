Rails.application.routes.draw do  
  root 'welcome#index'
  resources :users do
    member do
      get 'friends'
      get 'friend_requests'
      get 'pending_requests'
    end
  end
  resources :posts, :playlists, :videos
  resources :tags, only: [:index, :new, :create, :destroy]
  resources :friendships, only: [:create, :destroy] do
  end
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'accept' => 'friendships#accept'
end
