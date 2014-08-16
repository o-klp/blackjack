// Generated by CoffeeScript 1.7.1
var assert;

assert = chai.assert;

describe("deck constructor", function() {
  it("should create a card collection", function() {
    var collection;
    collection = new Deck();
    return assert.strictEqual(collection.length, 52);
  });
  it("should deal from the deck", function() {
    var collection, playerHand;
    collection = new Deck();
    playerHand = collection.dealPlayer();
    return assert.strictEqual(collection.length, 50);
  });
  it("should remove cards from deck on a hit", function() {
    var collection, playerHand;
    collection = new Deck();
    playerHand = collection.dealPlayer();
    playerHand.hit();
    return assert.strictEqual(collection.length, 49);
  });
  return it("should remove the last card of the deck on a hit", function() {
    var collection, lastCard, playerHand;
    collection = new Deck();
    playerHand = collection.dealPlayer();
    lastCard = collection.models[49];
    playerHand.hit();
    return assert.strictEqual(lastCard, playerHand.models[2]);
  });
});