# frozen_string_literal: true

class Staffs::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: :cancel
  prepend_before_action :authenticate_scope!, only: %i[update destroy]
  prepend_before_action :set_minimum_password_length, only: %i[new edit]
  before_action :admin_required
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :back_link, only: :create

  def edit
    @staff = Staff.find(params[:id])
    if params[:id].present?
      self.resource = resource_class.to_adapter.get!(params[:id])
    end
  end

  def update
    self.resource = resource_class.to_adapter.get!(params[:id])

    resource_updated = update_resource_without_password(resource, account_update_params)

    yield resource if block_given?
    if resource_updated
      if is_flashing_format?
        flash_key = if update_needs_confirmation?(resource, prev_unconfirmed_email)
                      :update_needs_confirmation
                    else
                      :updated
                    end
        set_flash_message :notice, flash_key
      end
      respond_with resource, location: after_update_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end

    def configure_account_update_params
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def sign_up(resource_name, _current_staff)
      sign_in(resource_name, resource)
    end

    def update_resource_without_password(resource, params)
      resource.update_without_password(params)
    end
end
