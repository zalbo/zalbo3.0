class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
    before_filter :configure_permitted_parameters, if: :devise_controller?
    before_filter :facebook_user, if: :user_signed_in?
    before_filter :render_nickname

  protected

  def facebook_user
    def process_uri(uri)
      require 'open-uri'
      require 'open_uri_redirections'
      open(uri, :allow_redirections => :safe) do |r|
        r.base_uri.to_s
      end
    end

    if current_user.provider
  

        avatar_url = process_uri(current_user.nick_avatar + "?type=large")
        current_user.update_attribute(:avatar, URI.parse(avatar_url))


    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :nickname, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:nickname, :email, :password, :password_confirmation, :current_password , :avatar) }
  end

  def render_nickname
    if current_user
      if current_user.nickname.size > 13
        nickname_short = current_user.nickname[0,10]
        @nickname_rendered =  nickname_short + "..."
      else
        @nickname_rendered = current_user.nickname
      end
    end
  end
end
