Template.status.status = -> Meteor.status().status
Template.status.debug = -> Session.get('debug')

$ ->
  $(document).on('selectstart', ->
    false
  )
  
  storeSize = ->
    Session.set('pageWidth', $(window).innerWidth())
    Session.set('pageHeight', $(window).innerHeight())
  $(window).on('resize', ->
    storeSize()
  )
  storeSize()
  
  $(document).on('touchstart', (e) -> e.preventDefault())
  $(document).on('touchmove', (e) -> e.preventDefault())
