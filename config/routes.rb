Rails.application.routes.draw do
  devise_for :users
  get 'home/about'
  root 'home#index'
  get 'home/add'
  resources :patients
  resources :doctors
  resources :appointments do
    post 'send_email_to_doctor', on: :member
    post 'send_email_to_patient', on: :member
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get 'home/old_about', to: redirect('home/about')
  get 'login', to: 'logins#new'
  get 'login/create', to: 'logins#create', as: :create_login
  # Defines the root path route ("/")
  # root "posts#index"
end
