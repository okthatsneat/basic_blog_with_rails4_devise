Blog::Application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles
end
