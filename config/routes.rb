Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update, :index, :show]

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  get 'blog' => 'welcome#blog'
  get 'inspiration' => 'welcome#inspiration'

  root to: 'welcome#index'

  resources :listings
  resources :brainstorms

  resources :categories do
    resources :jobs do
      resources :posts do
        resources :comments, only: [:create, :destroy]
      end
    end
  end
end
