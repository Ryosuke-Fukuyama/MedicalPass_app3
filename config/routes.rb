Rails.application.routes.draw do
  get 'hospital_labels/new'
  get 'hospital_labels/create'
  get 'hospital_labels/edit'
  get 'hospital_labels/update'
  get 'hospital_labels/destroy'
  get 'hospital_labels/_form'
  get 'hospitals/index'
  get 'hospitals/show'
  get 'hospitals/new'
  get 'hospitals/create'
  get 'hospitals/edit'
  get 'hospitals/update'
  get 'hospitals/destroy'
  get 'hospitals/_form'
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
