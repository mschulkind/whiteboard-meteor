Template.status.status = -> Meteor.status().status

$ ->
  $(document).on('selectstart', ->
    false
  )
  
  $$('#canvas').tap(->
  )
