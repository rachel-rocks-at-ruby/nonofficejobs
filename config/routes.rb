Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/blog'
  get 'welcome/brainstorms'
  get 'welcome/inspiration'

  root to: 'welcome#index'

 end
