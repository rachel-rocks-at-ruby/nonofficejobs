Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, only: [:update, :index, :show]

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  get 'contact' => 'welcome#contact'
  get 'blog' => 'welcome#blog'
  get 'quizzes' => 'welcome#quizzes'
  get 'inspiration' => 'welcome#inspiration'

  root to: 'welcome#index'

  resources :listings
  resources :brainstorms
  resources :mentors
  resources :messages
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
   collection do
      get :trashbin
      post :empty_trash
   end
  end
  resources :favorites, only: [:create, :destroy]
  resources :friendships, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  resources :flags, only: [:create, :destroy]

  resources :categories do
    resources :jobs do
      resources :resources
      resources :posts
        post '/up-vote' => 'votes#up_vote', as: :up_vote
        post '/down-vote' => 'votes#down_vote', as: :down_vote
    end
  end
end
