class window.GameView extends Backbone.View
  className: 'gameView'

  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').startDealerTurn()

  initialize: ->
    @render()
    @model.on('win', -> alert "YOU WON OMG")
    @model.on('lose', -> alert "you lost..")
    @model.on('push', -> alert "It's a tie!")

  render: ->
    @$el.children().detach()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: @model.get 'playerHand').el
    @$('.dealer-hand-container').html new HandView(collection: @model.get 'dealerHand').el
