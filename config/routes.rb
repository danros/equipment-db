EquipmentDb::Application.routes.draw do
  root      :to => 'home#show'
  resources :devices, :only => [:create, :edit, :new, :show, :update] do
    resources :maintainers, :only => [:create, :destroy, :new]
  end
  resources :sessions, :only => [:create, :new]
  resources :users, :only => [:create, :new, :show]

  match '/signout', to: 'sessions#destroy'
end
