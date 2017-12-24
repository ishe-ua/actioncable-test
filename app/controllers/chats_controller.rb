# frozen_string_literal: true

class ChatsController < ApplicationController
  layout 'chats'

  def index; end

  def show
    @whom = User.find(params[:user_id])
  end
end
