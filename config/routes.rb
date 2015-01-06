Rails.application.routes.draw do

  devise_for :users

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  get 'blog' => 'welcome#blog'
  get 'brainstorms' => 'welcome#brainstorms'
  get 'inspiration' => 'welcome#inspiration'

  root to: 'welcome#index'

  resources :jobs do
    resources :posts, except: [:index]
  end

  resources :posts, only: [:index] do
    resources :comments, only: [:create, :destroy]
  end

 end
