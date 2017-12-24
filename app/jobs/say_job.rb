# frozen_string_literal: true

class SayJob < ApplicationJob
  queue_as :default

  # See Chat
  def perform(who_id, whom_id, text)
    Chat.say(who_id, whom_id, text)
  end
end
