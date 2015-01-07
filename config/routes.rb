Rails.application.routes.draw do

  devise_for :users
  resources :users, only: [:update]

  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  get 'blog' => 'welcome#blog'
  get 'brainstorms' => 'welcome#brainstorms'
  get 'inspiration' => 'welcome#inspiration'

  root to: 'welcome#index'

  resources :jobs do
    resources :posts do
      resources :comments, only: [:create]
    end
  end
end
