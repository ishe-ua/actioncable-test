# frozen_string_literal: true

# See ChatChannel#say
class SayJob < ApplicationJob
  queue_as :default

  # See Chat#say
  def perform(chat_pair, text)
    who_id, whom_id = chat_pair.split('_').map(&:to_i)

    msg = Chat.say(who_id, whom_id, text)
    broadcast_to(chat_pair, msg) if msg

    msg # for test
  end

  protected

  def broadcast_to(chat_pair, msg)
    ActionCable.server.broadcast(chat_pair, msg: render_message(msg))
  end

  def render_message(msg)
    ApplicationController.renderer
                         .render(partial: 'chats/msg', locals: { msg: msg })
  end
end
