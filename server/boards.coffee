Meteor.publish('boards', (id) ->
  Boards.find({_id: id})
)
