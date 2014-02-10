events = require 'events'
Q = require 'q'

# Emits BTC price tick events
class CoinbaseBTCTicker extends events.EventEmitter
  constructor: (@intervalLength = 10000) ->
    @interval = null
    @last = null

  connect: ->
    setInterval =>
      @_tick()
    , @intervalLength

    # defer = Q.defer()
    # defer.resolveWith(@last)
    # defer.promise

  disconnect: ->
    # defer = Q.defer()
    # defer.resolveWith(true)
    # defer.promise

  _tick: ->
    @trigger 'tick', @last

module.exports = CoinbaseBTCTicker