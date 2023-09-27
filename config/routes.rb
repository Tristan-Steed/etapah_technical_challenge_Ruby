Rails.application.routes.draw do
  # Your existing routes, if any, may be defined above

  resources :packages
  root 'packages#index'
end
