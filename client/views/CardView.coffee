class window.CardView extends Backbone.View

  className: 'card'

  template: _.template '<img src="../2014-07-blackjack/img/cards/<%= rankName %>-<%= suitName %>.png" height="139px"/>'

  initialize: ->
    @model.on 'change', => @render
    @render()

  render: ->
    @$el.children().detach().end().html
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'
