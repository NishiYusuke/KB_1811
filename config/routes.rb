Rails.application.routes.draw do
  
  get 'root/index'

  root to: 'root#index'

  resources :rooms , shallow: true do
    member do
      get :count
      put :find
      get :front_person
      get :who
    end
  	
    resources :users do
  		member do
  			post :in_or_out
        get :is_late
  		end
  	end

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end