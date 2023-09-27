Rails.application.routes.draw do
  devise_for :users
  # Your existing routes, if any, may be defined above

  resources :packages
  root 'packages#index'
end
