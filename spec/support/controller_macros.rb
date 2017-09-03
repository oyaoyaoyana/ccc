module ControllerMacros
  def login_user(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in FactoryGirl.create(:user)
  end

  # def logout_user(user)
  #   sign_out user
  # end
end
