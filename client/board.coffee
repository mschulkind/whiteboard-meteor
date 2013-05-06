Meteor.Router.add(
  '/boards/:id': (id) ->
    Session.set('boardID', id)
    Meteor.subscribe('boards', id)
    'board'
)

Template.board.helpers(
  board: -> Boards.findOne(Session.get('boardID'))
)

Template.board.preserve(['#canvas'])
