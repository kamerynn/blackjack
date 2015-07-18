assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      deckLast = deck.last()
      hand.hit()
      handLast = hand.last()
      assert.strictEqual deckLast, handLast
      assert.strictEqual deck.length, 49

  describe 'check score', ->
    
    it 'should correctly check the score', ->
      sum = hand.reduce((memo, card)->
        memo + card.get('value')
      , 0)
      if hand.hasAce() and sum < 12 then sum += 10
      assert.strictEqual sum, hand.score()