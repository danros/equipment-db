EquipmentDb::Application.routes.draw do
  root      :to => 'home#show'
  resources :devices, :only => [:show]
end
