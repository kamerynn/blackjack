class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    if @isDealer then @trigger('dealerValidation', @) else @trigger('playerValidation', @)

  hasAce: -> @reduce (memo, card) ->
    memo or card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  # Need a helper function for determining which score is relevant in scores fn array
  score: ->
    # save scores into array variable
    scores = @scores()
    # check if score[1] is between 0 and 22 -> valid hand
    if 0 < scores[1] and scores[1] < 22 then scores[1] else scores[0]

  startDealerTurn: ->
    # flip the first card
    @at(0).flip()
    # validate score
    @trigger('dealerValidation', @)
