Rails.application.routes.draw do

  resources :posts

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'


  #root 'admin/users#index'

  namespace :admin do

    resources :users
    resources :orders
    resources :posts do
      member do
        get :get_post_2_id
        post :confirm_order
      end
    end

    resources :users do
      member do
        post :take_master
        post :customer

      end
    end
  end

  namespace :account do
    resources :users
    resources :posts
  end

  root 'welcome#index'

end
