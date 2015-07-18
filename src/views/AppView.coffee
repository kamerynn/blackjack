class window.AppView extends Backbone.View
  className: 'appView'

  template: _.template '
    <h1>Blackjack</h1>
    <div class="stats">
      <div class="win-loss">Games won/lost: 0 / 0</div>
      <div class="chips">Chips: 0</div> 
    </div>
    <div class="gameview-container"></div>
  '
  
  initialize: ->
    @render()

  render: ->
    # adds a new gameview into the DOM
    @$el.children().detach()
    @$el.html @template()
    @$('.gameView-container').html new GameView(model: @model.get 'game').el

