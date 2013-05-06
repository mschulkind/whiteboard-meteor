Meteor.publish('boards', (id) ->
  Boards.find({_id: id})
)

Meteor.startup(->
  Boards.allow(
    update: -> true
  )
)
