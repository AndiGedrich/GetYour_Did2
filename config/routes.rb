Rails.application.routes.draw do

  root 'static_pages#home'

  get 'static_pages/home'

  get 'static_pages/about'

  get 'salons/index' => 'salons#index', as: :salons_index

  get 'salons/:id' => 'salons#show', as: :salon

  get 'salons/edit'

  get 'appointments/index'

  get 'appointments/new'=> 'appointments#new', as: :new_appointment
  post 'appointments/' => 'appointments#create'

  get 'appointments/:id' => 'appointments#show', as: :appointment

  get 'appointments/edit'

  get 'appointments/delete'

  get 'categories/index'

  get 'services/new' => 'services#new', as: :new_service
  post 'services/' => 'services#create'

  get 'services/delete'

  get 'salons/show'

  get 'salons/edit'

  get 'users/show_tech/:id' => 'users#show_tech', as: :technician


  get 'users/new' => 'users#new', as: :new_user
  get 'users/new_tech' => 'users#new_tech', as: :new_technician
  post 'users/' => 'users#create'

  get 'users/index'

  get 'users/:id' => 'users#show', as: :user

  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  devise_for :users

  post 'sessions/new' => 'sessions#create', as: :create_session
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  get 'static_pages/services_select' => 'static_pages#services_select', as: :update_services





  namespace :api do
    resources :salons, :defaults => { :format => 'json' }, only: [:index, :show]
  end
end
