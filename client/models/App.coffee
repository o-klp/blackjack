#todo: refactor to have a game beneath the outer blackjack model
class window.App extends Backbone.Model

  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @get('playerHand').on 'stand', => @calculateScores()
    @get('playerHand').on 'bust', => @endGame()

  calculateScores: ->
  	# calculate player's score
  	playerScore = @get('playerHand').scores()
  	
  	# flip dealer's hand
  	@get('dealerHand').models[0].flip()
  	
  	# check if hitting or not
  	dealerScore = @get('dealerHand').scores()
  	@checkDealerScore dealerScore

  checkDealerScore: (dealerScore) ->
  	# check if less than 17 and no ace
  	if dealerScore < 17 and dealerScore.length isnt 2
  		# hit and check again
	  	@get('dealerHand').hit()
	  	@checkDealerScore @get('dealerHand').scores()

		# if 17+ and no ace
	  else if dealerScore >= 17 and dealerScore.length isnt 2
	  	@endGame()

	  # if have an ace and not over, end game
  	else if dealerScore[1] > 17 and dealerScore[1] < 22
	  		@endGame()
  		# all else, check lowest score
		  else @checkDealerScore dealerScore[0]

  endGame: ->
  	# prevent clicks on hit or stand

  	# calculate player's score
  	playerScore = @get('playerHand').scores()
  	
  	# flip dealer's hand in not already revealed
  	@get('dealerHand').models[0].flip() if !@get('dealerHand').models[0].get('revealed')

  	# calc dealer score
  	dealerScore = @get('dealerHand').scores()

  	# decide winner
  	if playerScore < 22 and playerScore > dealerScore or dealerScore > 21
  		alert("You win with the score of #{playerScore}!")
  	else if playerScore > 21
  		alert("Bust! You went over - score of #{playerScore}")
  	else if dealerScore > playerScore and dealerScore < 22
  		alert("You lose! Dealer score of #{dealerScore} is greater than #{playerScore}")

