# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern

  included do
    before_action :auth
  end

  def current_user
    @current_user ||= begin
                        user_id = cookies[:user_id]
                        user_id ? User.find(user_id) : nil
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
