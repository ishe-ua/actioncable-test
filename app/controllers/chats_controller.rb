# frozen_string_literal: true

class ChatsController < ApplicationController
  layout 'chats'
  before_action :auth

  def index; end

  def show
    # @who = User.find(cookies[:user_id])
    # @whom = User.find(params[:user_id])
  end

  def create; end

  protected

  def auth
    user_id = cookies[:user_id]
    redirect_to(root_path) unless user_id
  end
end
