jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')

  if $('#messages').length > 0

    App.room = App.cable.subscriptions.create { channel: "RoomChannel", room_id: $('#messages').data('room_id'), user_id: $('#messages').data('user_id'), company_id: $('#messages').data('company_id')},
     connected: ->
       # Called when the subscription is ready for use on the server

     disconnected: ->
       # Called when the subscription has been terminated by the server

     received: (data) ->
       $('#messages').append data['message']

     speak: (message, user_id, room_id, company_id) ->
        @perform 'speak', message: message, room_id: $('#messages').data('room_id'), user_id: $('#messages').data('user_id'), company_id: $('#messages').data('company_id')

$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13
     App.room.speak event.target.value
     event.target.value = ''
     event.preventDefault()
