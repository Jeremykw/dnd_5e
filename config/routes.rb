Rails.application.routes.draw do
  get 'reference/show'
	Dnd5e::Application.routes.draw do
  get 'reference/show'
    resources :users do
    	member do
    		get :delete
    	end
    end
    resources :characters do
	  	resources :abilities, :except => [:show]
	  	resources :skills, :except => [:show]
      resources :backgrounds, :except => [:show]
		end
    post 'login', :to => "users#attempt_login"
    get 'login', :to => 'users#login'
    get 'logout', :to => 'users#logout'
	  root :to => redirect('/characters') # Character index is homepage
	end
end
