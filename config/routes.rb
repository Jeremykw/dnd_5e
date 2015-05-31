Rails.application.routes.draw do
	Dnd5e::Application.routes.draw do
    resources :users
    resources :characters do
	  	resources :abilities
	  	resources :skills
      resources :backgrounds
		end
    post 'login', :to => "users#attempt_login"
    get 'login', :to => 'users#login'
    get 'logout', :to => 'users#logout'
	  root :to => redirect('/characters') # Character index is homepage
	end
end
