EquipmentDb::Application.routes.draw do
  devise_for :users

  root      :to => 'home#show'
  resources :devices, :only => [:create, :edit, :new, :show, :update] do
    resources :maintainers, :only => [:create, :destroy, :new]
  end
end
