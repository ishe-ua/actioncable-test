$(document).on 'turbolinks:load', ->
  return unless current_page('.chats.show')

  App.chat = App.cable.subscriptions.create "ChatChannel", chat: $('form').data('chat-id'),
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('.log').prepend(data.msg)
