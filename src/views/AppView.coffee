class window.AppView extends Backbone.View
  className: 'appView'

  template: _.template '
    <div class="gameview-container"></div>
  '

  initialize: ->
    @render()

  render: ->
    # adds a new gameview into the DOM
    @$el.children().detach()
    @$el.html @template()
    @$('.gameView-container').html new GameView(model: @model.get 'game').el

