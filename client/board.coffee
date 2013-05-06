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
  unless @_initted
    @_initted = true
    
    canvas = new fabric.StaticCanvas('canvas')
    Deps.autorun(->
      canvas.setDimensions(
        width: Session.get('pageWidth') - 10
        height: Session.get('pageHeight') - 10
      )
    )

    $('#canvas').
      hammer().
      on(
        drag: (e) ->
          canvas.add(new fabric.Circle(
            radius: 3
            fill: 'red'
            left: e.gesture.center.pageX - 6
            top: e.gesture.center.pageY - 6
          ))
      )
