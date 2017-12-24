# frozen_string_literal: true

class ChatsController < ApplicationController
  layout 'chats'

  def index; end

  def show
    # @who = User.find(cookies[:user_id])
    # @whom = User.find(params[:user_id])
  end

  def create; end
end
