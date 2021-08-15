# frozen_string_literal: true

class Patients::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @patient = Patient.find_for_google(request.env['omniauth.auth'])
    if @patient.persisted?
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Google'
      sign_in_and_redirect @patient, event: :authentication
    else
      session['devise.google_data'] = request.env['omniauth.auth']
      redirect_to new_patient_registration_url
    end
  end

  def failure
    root_path # new_patient_registration_path
  end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
