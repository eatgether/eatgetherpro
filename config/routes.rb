Rails.application.routes.draw do

  resources :posts
	resources :feedbacks

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #root 'posts#index'


  #root 'admin/users#index'

  namespace :admin do

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

		resources :feedbacks

  end


	resources :orders do
		resources :feedbacks
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
		resources :feedbacks
  end

  root 'welcome#index'

end
