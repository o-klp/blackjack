assert = chai.assert

describe "deck constructor", ->

  it "should create a card collection", ->
    collection = new Deck()
    assert.strictEqual collection.length, 52

  it "should deal from the deck", ->
    collection = new Deck()
    playerHand = collection.dealPlayer()
    assert.strictEqual collection.length, 50

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
