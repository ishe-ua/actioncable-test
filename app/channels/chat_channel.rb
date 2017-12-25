# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from params[:chat]
  end

  def unsubscribed; end

  # See SayJob, channels/chat.coffee
  def receive(data)
    chat_pair = data['chat_pair']
    text = data['text']

    return if chat_pair.blank? || text.blank?

    method = if Rails.env.development? || Rails.env.test?
               :perform_now
             else
               :perform_later
             end

    SayJob.send(method, chat_pair, text.strip)
  end
end
