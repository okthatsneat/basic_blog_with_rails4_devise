Blog::Application.routes.draw do
  root 'articles#index'
  authenticated :user do
    #placeholder for custom redirect after login, default is root
  end
  devise_for :users
  resources :articles
end
