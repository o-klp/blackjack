assert = chai.assert

describe "hand collection", ->

  it "should remove cards from deck on a hit", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    playerHand.hit()
    assert.strictEqual collection.length, 49

  it "should remove the last card of the deck on a hit", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    lastCard = collection.models[49]
    playerHand.hit()
    assert.strictEqual lastCard, playerHand.models[2]

  it "should return 1 score", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    score = []
    score.push playerHand.maxScores()
    assert.strictEqual score.length, 1

  it "should bust if player goes over 21", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    playerHand.hit()
    playerHand.hit()
    playerHand.hit()
    playerHand.hit()
    assert.strictEqual playerHand.busted(), true
