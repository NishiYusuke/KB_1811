Rails.application.routes.draw do
  
  resources :rooms , shallow: true do
    member do
      get :count
      put :find
      get :front_person
    end
  	
    resources :users do
  		member do
  			post :in_or_out
  		end
  	end

  end

  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end