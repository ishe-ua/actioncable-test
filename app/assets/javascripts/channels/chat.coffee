$(document).on 'turbolinks:load', ->
  return unless current_page('.chats.show')

  App.chat = App.cable.subscriptions.create "ChatChannel", room: $('form').data('chat-id'),
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      # Called when there's incoming data on the websocket for this channel
