Rails.application.routes.draw do
	Dnd5e::Application.routes.draw do
	    
	    resources :characters do
		  	resources :abilities
		  	resources :skills
        resources :backgrounds
			end
	  root :to => redirect('/characters') # Character index is homepage
	end
end
