// Generated by CoffeeScript 1.7.1
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

window.App = (function(_super) {
  __extends(App, _super);

  function App() {
    return App.__super__.constructor.apply(this, arguments);
  }

  App.prototype.initialize = function() {
    var deck;
    this.set('deck', deck = new Deck());
    this.set('playerHand', deck.dealPlayer());
    this.set('dealerHand', deck.dealDealer());
    this.get('playerHand').on('bust', (function(_this) {
      return function() {
        return _this.dealerWin();
      };
    })(this));
    this.get('playerHand').on('stand', (function(_this) {
      return function() {
        return _this.get('dealerHand').playTo17();
      };
    })(this));
    this.get('dealerHand').on('bust', (function(_this) {
      return function() {
        return _this.playerWin();
      };
    })(this));
    return this.get('dealerHand').on('stand', (function(_this) {
      return function() {
        return _this.findWinner();
      };
    })(this));
  };

  App.prototype.playerWin = function() {
    return this.trigger('player:win', this);
  };

  App.prototype.dealerWin = function() {
    return this.trigger('dealer:win', this);
  };

  App.prototype.findWinner = function() {
    var dealerScore, playerScore;
    playerScore = this.get('playerHand').maxScores();
    dealerScore = this.get('dealerHand').maxScores();
    console.log("player score is " + playerScore + " - dealerScore is " + dealerScore);
    if (dealerScore > playerScore) {
      return this.dealerWin();
    } else {
      return this.playerWin();
    }
  };

  return App;

})(Backbone.Model);
