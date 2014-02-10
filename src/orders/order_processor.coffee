# Handles filling of orders through an external Bitcoin wallet API
class OrderProcessor
  fill: (orders) ->
    for order in orders