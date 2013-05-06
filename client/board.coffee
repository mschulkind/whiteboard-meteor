Meteor.Router.add(
  '/boards/:id': (id) ->
    Session.set('boardID', id)
    Meteor.subscribe('boards', id)
    'board'
)

Template.board.preserve(['#canvas'])

renderPoints = (canvas, points) ->
  for point in points
    canvas.add(new fabric.Circle(
      radius: 3
      fill: 'red'
      left: point.x
      top: point.y
    ))

Template.board.rendered = ->
  unless @_initted
    @_initted = true
    
    canvas = new fabric.StaticCanvas('canvas')
    
    Boards.find(Session.get('boardID')).observe(
      added: (board) ->
        renderPoints(canvas, board.points)
        
      changed: (newBoard, oldBoard) ->
        renderPoints(
          canvas,
          _(newBoard.points).last(
            newBoard.points.length - oldBoard.points.length
          ))
    )

    Deps.autorun(->
      canvas.setDimensions(
        width: Session.get('pageWidth') - 10
        height: Session.get('pageHeight') - 10
      )
    )
    
    board = Boards.findOne(Session.get('boardID'))
    renderPoints(canvas, board.points) if board

    $('#canvas').
      hammer().
      on(
        drag: (e) ->
          x = e.gesture.center.pageX - 6
          y = e.gesture.center.pageY - 6
          
          Boards.update(Session.get('boardID'),
            $push:
              points:
                x: x
                y: y
          )
      )
