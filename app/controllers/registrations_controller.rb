class RegistrationsController < Devise::RegistrationsController
# update devise's inherent registratios controller to allow for new params

  private

  def sign_up_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:fname, :lname, :email, :password, :password_confirmation, :current_password)
  end
end
