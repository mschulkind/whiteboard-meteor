Session.set('tapCount', 0)
Template.canvas.tapCount = -> Session.get('tapCount')

Template.status.status = -> Meteor.status().status

$ ->
  $(document).on('selectstart', ->
    false
  )
  
  $$('#canvas').tap(->
    Session.set('tapCount', 1)
  )
