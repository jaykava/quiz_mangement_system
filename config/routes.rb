Rails.application.routes.draw do
  # Root route
  root "quizzes#index"

  # Authentication
  get "/login", to: "sessions#new", as: :login
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy", as: :logout

  # Public quiz routes
  resources :quizzes, only: [ :index, :show ] do
    member do
      post :start_attempt
    end
  end

  # Quiz attempts
  resources :quiz_attempts, only: [] do
    member do
      get :start
      get :question
      post :answer
      get :results
    end
  end

  # Admin namespace
  namespace :admin do
    root "quizzes#index"
    resources :quizzes do
      member do
        patch :toggle_publish
      end
      resources :questions, shallow: true do
        resources :options, only: [ :create, :update, :destroy ]
      end
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
