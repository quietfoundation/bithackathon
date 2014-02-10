events = require 'events'
Q = require 'q'

# Emits fake BTC price tick events
class FixtureBTCTicker extends events.EventEmitter
  constructor: (@intervalLength = 500) ->
    @interval = null
    @last = 100

  connect: ->
    setInterval =>
      @_tick()
    , @intervalLength

    defer = Q.defer()
    defer.resolveWith(@last)
    defer.promise

  disconnect: ->
    defer = Q.defer()
    defer.resolveWith(true)
    defer.promise

  getLast: -> @last

  # Random true/false
  _coinToss: -> (Math.random() * 100) > 50

  # 0 (inclusive) to 0.1 (exclusive)
  _randomIncrement: -> Math.floor((Math.random() * 10)) / 100

  _updatePrice: ->
    direction = if @_coinToss() then 1 else -1
    @last = @last + (direction * @_randomIncrement())

  _tick: ->
    @_updatePrice()
    @trigger 'tick', @getLast()

module.exports = FixtureBTCTicker