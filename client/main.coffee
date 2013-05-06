$ ->
  Session.set('tapCount', 0)
  Template.canvas.tapCount = -> Session.get('tapCount')

  $(document).on('selectstart', ->
    false
  )
  
  $$('#canvas').tap(->
    Session.set('tapCount', 1)
  )
