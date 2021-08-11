Rails.application.routes.draw do
  root 'tops#index'
  get 'tutorials/index'

  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    passwords: 'patients/passwords',
    registrations: 'patients/registrations',
    omniauth_callbacks: 'patients/omniauth_callbacks'
  }
  resources :patients do
    post :pay, on: :member
  end

  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations'
  }
  resources :staffs, only: %i[index update destroy]

  resources :health_interviews
  # post 'health_interviews/index'
  # namespace :api, format: 'json' do
  #   namespace :v1 do
  #     resources :health_interviews, only: %i[index update]
  #   end
  # end

  post '/tutorials/guest_sign_in', to: 'tutorials#guest_sign_in'
  post '/tutorials/guest_admin_sign_in', to: 'tutorials#guest_admin_sign_in'
end
