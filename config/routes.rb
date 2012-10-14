EquipmentDb::Application.routes.draw do
  root      :to => 'home#show'
  resources :devices, :only => [:create, :edit, :new, :show, :update]
  resources :sessions, :only => [:create, :new]

  match '/signout', to: 'sessions#destroy'
end
