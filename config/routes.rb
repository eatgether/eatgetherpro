Rails.application.routes.draw do

  resources :posts do
    member do
      post :application
      post :cancel_application
    end
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'posts#index'


  #root 'admin/users#index'

  namespace :admin do

    resources :users
    resources :orders do
    	member do
    		post :confirm_cancel
				post :admin_revive
    	end
    end
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


	resources :orders do
	end

  namespace :account do
    resources :users
    resources :posts
    resources :orders do
      member do
				post :confirm_meeting
				post :ask_cancel
      end
    end
  end

  root 'welcome#index'
end
