class Patients::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @patient = Patient.from_omniauth(request.env['omniauth.auth'])
    if @patient.persisted?
      sign_in_and_redirect @patient, event: :authentication
      set_flash_message(:notice, :success, kind: provider.to_s.capitalize) if is_navigational_format?
    else
      session['devise.patient_attributes'] = @patient.attributes
      redirect_to new_patient_registration_url
    end
  end

  def failure
    redirect_to root_path
  end
end
