Rails.application.routes.draw do
  root 'tops#index'

  resources :tutorials, only: [:index] do
    collection do
      post 'guest_sign_in'
      post 'guest_staff_sign_in'
      post 'guest_admin_sign_in'
    end
  end

  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    passwords: 'patients/passwords',
    registrations: 'patients/registrations',
    omniauth_callbacks: 'patients/omniauth_callbacks'
  }
  resources :patients, only: %i[index show update destroy] do
    post :pay, on: :member
  end

  devise_for :staffs, controllers: {
    sessions: 'staffs/sessions'
  }
  resources :staffs, except: [:show]

  resources :hospitals do
    collection do
      get 'maps'
    end
    resources :health_interviews
    # post 'health_interviews/index'
    # namespace :api, format: 'json' do
    #   namespace :v1 do
    #     resources :health_interviews, only: %i[index update]
    #   end
    # end
  end

  resources :favorite_hospitals, only: %i[index create destroy]

  resources :hospital_labels, except: [:show]

  devise_for :masters, controllers: {
    sessions: 'masters/sessions'
  }
  resources :masters, only: %i[create edit update]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
