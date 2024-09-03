# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  def google_oauth2
    user = User.from_omniauth(auth)
    if user.present?
      flash[:success] = t "devise.omniauth_callbacks.success", kind: "Google"
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t "devise.omniauth_callbacks.failure", kind: "Google", reason: "User does not exist. Kindly Sign Up"
      redirect_to new_user_registration_path(email: auth.info.email)
    end
  end
  private
  def auth
    @auth ||= request.env['omniauth.auth']
  end
end
