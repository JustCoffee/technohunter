class Users::RegistrationsController < Devise::RegistrationsController

  before_action :update_sanitized_params, if: :devise_controller?
  skip_before_filter :require_no_authentication, only: [:new, :create]

    def update_sanitized_params
       devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:user_role, :email,   :password, :password_confirmation,
          :comp_name, :law_name, :law_address, :post_address, :site, :inn, 
          :fio_ruk, :fio_buch, :fio_main_person, :gor_tel_main, :mob_tel_main,
          :fio_dop_person, :email_dop, :gor_tel_dop, :mob_tel_dop, :email_main)}
    end

  def new
    super
  end

  def create
  	super
  end
end