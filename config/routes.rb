Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/blog'
  get 'welcome/brainstorms'
  get 'welcome/inspiration'

  root to: 'welcome#index'

 end
