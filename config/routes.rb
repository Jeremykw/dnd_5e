Rails.application.routes.draw do
	Dnd5e::Application.routes.draw do
    resources :items, :only => [:index]

    resources :belongings, :except => [:index] do  # Equipment
      member do
        get :starting_equipment
      end
    end
    # Character
    resources :characters do
	  	resources :abilities, :except => [:show]
	  	resources :skills, :except => [:show]
      resources :backgrounds, :except => [:show]
		end

    # Users and Login
    resources :users do
      member do
        get :delete
      end
    end
    post 'login', :to => "users#attempt_login"
    get 'login', :to => 'users#login'
    get 'logout', :to => 'users#logout'
	  root :to => redirect('/characters') # Character index is homepage
	end
end
