Q = require 'q'
BTCTicker = require './ticker/fixture_ticker'
OrderIndex = require './orders/fixture_order_index'
OrderProcessor = require './orders/fixture_order_processor'

# Handles order processing, driven by price change events
class Backbot
  constructor: ->
    @ticker = new BTCTicker
    @orders = new OrderIndex

  start: ->
    Q.all([@orders.connect(), @ticker.connect()])
    .then(([orders, ticker]) ->
    )
    .fail(->
    )

module.exports = Backbot