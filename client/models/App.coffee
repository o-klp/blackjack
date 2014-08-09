#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', => @calculateScores()

  calculateScores: ->
  	# calculate player's score
  	playerScore = @get('playerHand').scores()
  	
  	# flip dealer's hand
  	@get('dealerHand').models[0].flip()

  	# decide to hit or not
  	dealerScore = @get('dealerHand').scores()
  	@checkDealerScore dealerScore
  	# console.log dealerScore
  	# dealerScore = @get('dealerHand').hit() if dealerScore < 17
  	# console.log playerScore, dealerScore, @get('dealerHand').models.map(card) ->
  	 	# card.get('revealed')

  checkDealerScore: (dealerScore) ->
  	if dealerScore < 17 and dealerScore.length isnt 2
	  	@get('dealerHand').hit()
	  	@checkDealerScore @get('dealerHand').scores()
	  else
	  	if dealerScore[1] > 17 and dealerScore[1] < 22
	  		@checkDealerScore dealerScore[1] 
		  else
		  	@checkDealerScore dealerScore[0]
