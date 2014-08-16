class window.Hand extends Backbone.Collection

  model: Card

  playable: true

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    return if !@playable
    @add(@deck.pop()).last()
    if @busted()
      @playable = false
      @trigger 'bust', @

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    hasAce = @reduce (memo, card) ->
      memo or card.get('value') is 1
    , false
    score = @reduce (score, card) ->
      score + if card.get 'revealed' then card.get 'value' else 0
    , 0
    if hasAce then [score, score + 10] else [score]

  busted: ->
    @maxScores() > 21

  maxScores: ->
    scores = @scores()
    if scores.length > 1
      if scores[1] < 22 then scores[1] else scores[0]
    else
      scores[0]

  playTo17: ->
    return if !@playable
    @models[0].flip()
    while @maxScores() < 17
      @hit()
    if !@busted()
      @stand()

  stand: ->
    return if !@playable
    @playable = false
    @trigger 'stand', @
