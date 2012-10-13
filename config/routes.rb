EquipmentDb::Application.routes.draw do
  root      :to => 'home#show'
  resources :devices, :only => [:show]
  resources :sessions, :only => [:new, :create]
end
