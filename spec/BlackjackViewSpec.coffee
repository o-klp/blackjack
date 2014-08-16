assert = chai.assert

describe 'app', ->
  deck = null
  hand = null
  dealerHand = null
  playerHand = null

  beforeEach ->
    deck = new Deck()
    dealerHand = deck.dealDealer()
    playerHand = deck.dealPlayer()

  it "should play dealer\'s hand on a player stand event", ->
    beforeScore = dealerHand.maxScores()
    playerHand.trigger 'stand'
    afterScore = dealerHand.maxScores()
    assert.notEqual beforeScore, afterScore