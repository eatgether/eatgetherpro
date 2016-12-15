Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :registrations => "acme/registrations"}
  post 'verifications' => 'verifications#create'
  get 'welcome/abouthelp'
  get 'welcome/aboutus'
  get 'welcome/service'
  get 'welcome/contactus'
#	resources :users
  resources :restaurants
	resources :notifications do
    member do
      get :redirect_notification
    end
  end
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
    resources :restaurants do
      member do
        get :photo
    end
  end
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
        post :publish
        post :hide
      end
    end

    resources :users do
      member do
        post :take_master
        post :customer
      end
    end

		resources :feedbacks  do
      member do
        post :publish
        post :hide
      end
    end
  end




  resources :interests

  resources :orders

  namespace :account do
    resources :users do
      member do
        get :photo
        get :counterpart
      end
    end

    resources :posts do
      member do
        post :application_approved
      end
    end

    resources :order_twos do

      resources :user_conversations
      member do
				post :confirm_meeting
				post :ask_cancel
      end
			resources :feedbacks do
        collection do
          post :rating
        end
			end
    end

    resources :conversations do
      member do
        post :reply
      end
    end
    resources :user_conversations
    resources :feedbacks
    resources :asker_requests
  end

  root "welcome#index"
end
