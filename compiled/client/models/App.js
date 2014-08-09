// Generated by CoffeeScript 1.7.1
(function() {
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
      this.get('playerHand').on('stand', (function(_this) {
        return function() {
          return _this.calculateScores();
        };
      })(this));
      return this.get('playerHand').on('bust', (function(_this) {
        return function() {
          return _this.endGame();
        };
      })(this));
    };

    App.prototype.calculateScores = function() {
      var dealerScore, playerScore;
      playerScore = this.get('playerHand').scores();
      this.get('dealerHand').models[0].flip();
      dealerScore = this.get('dealerHand').scores();
      return this.checkDealerScore(dealerScore);
    };

    App.prototype.checkDealerScore = function(dealerScore) {
      if (dealerScore < 17 && dealerScore.length !== 2) {
        this.get('dealerHand').hit();
        return this.checkDealerScore(this.get('dealerHand').scores());
      } else if (dealerScore >= 17 && dealerScore.length !== 2) {
        return this.endGame();
      } else if (dealerScore[1] > 17 && dealerScore[1] < 22) {
        return this.endGame();
      } else {
        return this.checkDealerScore(dealerScore[0]);
      }
    };

    App.prototype.endGame = function() {
      var dealerScore, playerScore;
      playerScore = this.get('playerHand').scores();
      if (!this.get('dealerHand').models[0].get('revealed')) {
        this.get('dealerHand').models[0].flip();
      }
      dealerScore = this.get('dealerHand').scores();
      if (playerScore < 22 && playerScore > dealerScore || dealerScore > 21) {
        return alert("You win with the score of " + playerScore + "!");
      } else if (playerScore > 21) {
        return alert("Bust! You went over - score of " + playerScore);
      } else if (dealerScore > playerScore && dealerScore < 22) {
        return alert("You lose! Dealer score of " + dealerScore + " is greater than " + playerScore);
      }
    };

    return App;

  })(Backbone.Model);

}).call(this);

//# sourceMappingURL=App.map
