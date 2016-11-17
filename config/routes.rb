Rails.application.routes.draw do

  resources :posts do
    member do
      post :application
      post :cancel_application
    end
  end

  devise_for :users


  namespace :admin do
    resources :order_twos do
      member do
        post :confirm_cancel
				post :admin_revive
      end
    end
    resources :interests
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

  resources :interests
	resources :orders do
	end

  namespace :account do
    resources :users
    resources :posts do
      member do
        post :application_approved
      end
    end
    resources :order_twos do
      member do
				post :confirm_meeting
				post :ask_cancel
      end
    end
  end

  root 'welcome#index'
end
