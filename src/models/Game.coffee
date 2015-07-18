# Game model should contain specific game data (hand validation, hand comparison, 
# win/loss effects during one game)
class window.Game extends Backbone.Model
  initialize: ->
    # prepare the game
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('dealerHand').on('dealerValidation', (hand) ->
      score = hand.score()
      if score is 21 then @trigger('lose')
      else if score > 21 then @trigger('win')
      else if score < 17 then hand.hit()
      else @compareScores();
    , @)

    @get('playerHand').on('playerValidation', (hand) ->
      score = hand.score()
      if score is 21 then @trigger('win')
      else if score > 21 then @trigger('lose')
    , @)

  compareScores: ->
    console.log "comparing..."
    