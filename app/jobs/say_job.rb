# frozen_string_literal: true

# See ChatChannel#say
class SayJob < ApplicationJob
  queue_as :default

  # See Chat#say
  def perform(from_chat, text)
    who_id, whom_id = from_chat.split('_')

    Chat.say(who_id, whom_id, text) &&
      ActionCable.server.broadcast(from_chat,
                                   msg: render_message(from_chat, text))
  end

  protected

  def render_message(_from_chat, _text)
    ApplicationController.renderer.render(partial: 'chats/msg',
                                          locals: { msg: msg }) # TODO
  end
end
