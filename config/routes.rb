Rails.application.routes.draw do
  resources :gardens
  resources :plants
	resources :users
		post '/login', to: 'auth#create'
		get '/individualplants', to: 'plants#fetch_individual'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
