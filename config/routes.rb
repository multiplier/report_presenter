ReportPresenter::Application.routes.draw do
	# Devise
	devise_for :users, :path_prefix => 'auth'
	devise_scope :user do
		get "login", :to => "devise/sessions#new"
		get "register", :to => "devise/registrations#new"
	end  

	# Dashboard
	root 'home#index'
	get 'admin', to: 'reports#admin'


  resources :reports do
  	get :admin, on: :collection
  end
end