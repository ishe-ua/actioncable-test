# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    name = params[:name].downcase.strip
    if name.present?
      cookies[:name] = name
      redirect_to chats_path
    else
      redirect_to new_session_path
    end
  end
end
