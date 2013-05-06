Meteor.Router.add(
  '/boards/:id': (id) ->
    Session.set('boardID', id)
    Meteor.subscribe('boards', id)
    'board'
)

Template.board.helpers(
  board: -> Boards.findOne(Session.get('boardID')) || {}
)

Template.board.preserve(['#canvas'])

Template.board.rendered = ->
  unless @_eventsBound
    @_eventsBound = true
    
    Event.add(@find('#canvas'), 'click', ->
      alert 'hi'
    )
