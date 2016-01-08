Rails.application.routes.draw do
  devise_for :technicians
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

  get 'categories/show'

  get 'categories/new'

  get 'services/new' => 'services#new', as: :new_service
  post 'services/' => 'services#create'

  get 'services/delete'

  get 'salons/show'

  get 'salons/edit'

  get 'technicians/new/:id' => 'technicians#new', as: :new_technician
  post 'technicians/' => 'technicians#create'

  get 'technicians/:id' => 'technicians#show', as: :technician


  get 'users/new' => 'users#new', as: :new_user
  get 'users/new_tech' => 'users#new_tech', as: :new_tech
  post 'users/' => 'users#create'

  get 'users/index'

  get 'users/:id' => 'users#show', as: :user

  get 'users/:id/edit' => 'users#edit', as: :edit_user
  patch 'users/:id' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  get 'sessions/new' => 'sessions#new', as: :new_session
  post 'sessions/new' => 'sessions#create', as: :create_session
  get 'sessions/destroy' => 'sessions#destroy', as: :destroy_session

  devise_for :users

  namespace :api do
    resources :salons, :defaults => { :format => 'json' }, only: [:index, :show]
  end
end
