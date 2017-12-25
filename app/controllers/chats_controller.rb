# frozen_string_literal: true

class ChatsController < ApplicationController
  layout 'chats'

  def index; end

  def show
    @whom = User.find_by(id: params[:user_id])
    redirect_to new_session_path unless current_user || @whom
  end
end
