Meteor.Router.add(
  '/boards/:id': (id) ->
    Session.set('boardID', id)
    Meteor.subscribe('boards', id)
    'board'
)

Template.board.helpers(
  board: -> Boards.findOne(Session.get('boardID'))
)

$ ->
  $$('#canvas').tap(->
    Boards.update(Session.get('boardID'), '$inc': {tap_count: 1})
  )
