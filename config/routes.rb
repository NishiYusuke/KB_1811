Rails.application.routes.draw do
  
  resources :histories
  resources :rooms , shallow: true do
  	resources :users
  end

  root 'rooms#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end