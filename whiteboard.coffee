if Meteor.isClient
  Template.canvas.events(
    'click input': ->
      # template data, if any, is available in 'this'
      puts "You pressed the button"
  )
  

if Meteor.isServer
  Meteor.startup(->
    # code to run on server at startup
  )
