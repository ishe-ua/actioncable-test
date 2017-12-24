# frozen_string_literal: true

module Auth
  extend ActiveSupport::Concern

  included do
    before_action :auth
  end

  protected

  def auth
    user_id = cookies[:user_id]
    redirect_to new_session_path unless user_id
  end
end
