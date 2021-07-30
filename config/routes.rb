Rails.application.routes.draw do
  # root 'tops#index'
  root 'health_interviews#index'
  resources :health_interviews
end
