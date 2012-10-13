EquipmentDb::Application.routes.draw do
  root      :to => 'home#show'
  resources :devices, :only => [:create, :new, :show]
  resources :sessions, :only => [:create, :new]
end
