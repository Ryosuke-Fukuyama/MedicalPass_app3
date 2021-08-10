Rails.application.routes.draw do
  # root 'tops#index'
  root 'health_interviews#index'

  devise_for :patients, controllers: {
    sessions:      'patients/sessions',
    passwords:     'patients/passwords',
    registrations: 'patients/registrations'
    omniauth_callbacks: 'patients/omniauth_callbacks'
  }
  resources :patients

  resources :health_interviews
  # post 'health_interviews/index'
  # namespace :api, format: 'json' do
  #   namespace :v1 do
  #     resources :health_interviews, only: %i[index update]
  #   end
  # end
end
