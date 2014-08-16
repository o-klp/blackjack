#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    @get('playerHand').on 'bust', => @dealerWin()
    @get('playerHand').on 'stand', => @get('dealerHand').playTo17()
    
    @get('dealerHand').on 'bust', => @playerWin()
    @get('dealerHand').on 'stand', => @findWinner()


  playerWin: ->
    @trigger 'player:win', @

  dealerWin: ->
    @trigger 'dealer:win', @

  tie: ->
    @trigger 'tie', @

  findWinner: ->
    playerScore = @get('playerHand').maxScores()
    dealerScore = @get('dealerHand').maxScores()
    if dealerScore > playerScore then @dealerWin() else if playerScore > dealerScore
    then @playerWin() else @tie()