assert = chai.assert

describe 'deck constructor', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'deck', ->
    it "should create a card collection", ->
      collection = new Deck()
      assert.strictEqual collection.length, 52

    it "should deal from the deck", ->
      collection = new Deck()
      playerHand = collection.dealPlayer()
      assert.strictEqual collection.length, 50

    it "should hide the first card after dealing the dealer's hand", ->
      collection = new Deck()
      dealerHand = collection.dealDealer()
      assert.strictEqual dealerHand.models[0].get('revealed'), false