# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern

  included do
    before_action :auth

    helper_method :current_user
    helper_method :signed_in?
  end

  def current_user
    @current_user ||= begin
                        user_id = cookies[:user_id]
                        user_id ? User.find_by(id: user_id) : nil
                      end
  end

  def signed_in?
    current_user ? true : false
  end

  protected

  def auth
    redirect_to new_session_path unless signed_in?
  end
end
