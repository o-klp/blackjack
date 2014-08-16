assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    dealerHand = deck.dealPlayer()
    playerHand = deck.dealPlayer()

  it 'should give a max score', ->
    # scores = 
    console.log deck, dealerHand, playerHand
    assert.strictEqual scores.length, 1