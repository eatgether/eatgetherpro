Rails.application.routes.draw do

  devise_for :users

  resources :posts

	resources :feedbacks

  resources :posts do
    member do
      post :application
      post :cancel_application
    end
  end

  namespace :admin do
    resources :order_twos do
      member do
        post :confirm_cancel
				post :admin_revive
      end
      resources :feedbacks
    end
    resources :interests
    resources :users
    resources :orders do
    	member do
    		post :confirm_cancel
				post :admin_revive
    	end
			resources :feedbacks
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

		resources :feedbacks
  end


    resources :conversations do
    resources :order_twos
  end

  resources :interests
	resources :orders do
	end

  namespace :account do
    resources :users do
      member do
        get :photo
      end
    end
    resources :posts do
      member do
        post :application_approved
      end
    end
    resources :order_twos do
      resources :conversations
      resources :user_conversations
      member do
				post :confirm_meeting
				post :ask_cancel
      end
			resources :feedbacks
    end
    resources :conversations do
      member do
        post :reply
      end
    end
    resources :user_conversations
  end


  root "welcome#index"
end
