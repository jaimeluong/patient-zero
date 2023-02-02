Rails.application.routes.draw do
  # User Users controller for Devise
  devise_for :users

  # Allow for user to sign out at path (destroy current session)
  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  
  # Root to Home controller
  root to: "home#index"

  # Add RESTful routes to Providers, Patients, and Appointments
  resources :providers
  resources :patients
  resources :appointments
end
