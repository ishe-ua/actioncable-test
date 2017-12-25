$(document).on 'turbolinks:load', ->
  return unless current_page('.chats.show')

  App.chat = App.cable.subscriptions.create channel: "ChatChannel", chat: $('form').data('chat-id'),
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      $('.log').prepend(data.msg)

  $('form').on 'submit', (e) ->
    e.preventDefault()

    chat_pair = $('form').data('chat-id')
    text = $('form .text').val().trim()

    if text
      App.chat.send({ chat_pair: chat_pair, text: text })
      $('form .text').val('')

    false
