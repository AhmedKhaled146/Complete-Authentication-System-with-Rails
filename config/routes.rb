Rails.application.routes.draw do
  get ":id", to: 'current_user#show'
  put "users/:id", to: "current_user#update"
  put "users/:id/update_password", to: "current_user#change_password"

  # Profile Pic Upload & Edit
  patch "users/:id/upload_profile_picture", to: "current_user#upload_profile_picture"
  patch "users/:id/update_profile_picture", to: "current_user#update_profile_picture"

  get 'password/edit', to: 'passwords#edit', as: :edit_password

  post "password/forgot", to: "passwords#forgot_password"
  post "password/reset", to: "passwords#reset_password"

  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup',
  }, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
