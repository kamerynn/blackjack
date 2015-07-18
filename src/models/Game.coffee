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
      if score is 21 then 'lose' # trigger Lose
      else if score > 21 then 'win' #trigger Win
      else if score < 17 then hand.hit()
      else 'compare scores' # trigger compare scores
    , @)

    @get('playerHand').on('playerValidation', (hand) ->
      score = hand.score()
      if score is 21 then console.log 'win' # trigger Win
      else if score > 21 then console.log 'lose' # trigger Lose
    , @)
    