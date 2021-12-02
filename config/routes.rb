Rails.application.routes.draw do
  resources :vehicles  
  root 'vehicles#index' 
  mount Vehicles::VehiclesAPI => '/api/vehicles'  


  # get 'vehicles/index'
  # get 'vehicles/show'
  # get 'vehicles/new'
  # get 'vehicles/create'
  # get 'vehicles/edit'
  # get 'vehicles/update'
  # get 'vehicles/destroy'
  
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
