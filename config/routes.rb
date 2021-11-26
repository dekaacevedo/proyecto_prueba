Rails.application.routes.draw do
  devise_for :users
  root to: 'appointments#daily'

  # Nesting Appointments to Users, without duplicating users routes
  resources :users, only: [] do
    resources :appointments, only: %i[index new create edit update destroy]
    get 'daily', to: 'appointments#daily'
  end

  resources :patients

end
