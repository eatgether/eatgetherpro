Rails.application.routes.draw do
  resources :posts

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'admin/users#index'

  namespace :admin do
    resources :users
  end

  root 'welcome#index'
end
