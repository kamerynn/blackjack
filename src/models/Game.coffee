# Game model should contain specific game data (hand validation, hand comparison, 
# win/loss effects during one game)
class window.Game extends Backbone.Model
  initialize: ->
    # prepare the game
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
