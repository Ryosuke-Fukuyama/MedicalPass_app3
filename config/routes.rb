Rails.application.routes.draw do
  # root 'tops#index'
  root 'health_interviews#index'
  resources :health_interviews
  # post 'health_interviews/index'
  namespace :api, format: 'json' do
    namespace :v1 do
      resources :health_interviews, only: %i[index update]
    end
  end
end
