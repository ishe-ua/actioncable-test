# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    name = params[:name].downcase.strip
    if name.present? && (user = User.find_or_create_by(name: name))
      cookies[:user_id] = user.id
      redirect_to chats_path
    else
      flash.alert = 'Empty user'
      redirect_to new_session_path
    end
  end
end
