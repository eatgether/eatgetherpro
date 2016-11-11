Rails.application.routes.draw do

  resources :posts

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'


  #root 'admin/users#index'

  namespace :admin do

    resources :users
    resources :posts do
      member do
        get :get_post_2_id

    resources :users do
      member do
        post :take_master
        post :customer

      end
    end
  end

  root 'welcome#index'

end
