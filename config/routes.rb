Rails.application.routes.draw do  
  get 'videos/index'

  get 'videos/show'

  get 'videos/new'

  get 'videos/edit'

  root 'welcome#index'
  resources :users, :posts, :playlists, :videos
  resources :tags, only: [:index, :new, :create, :destroy]
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
end
