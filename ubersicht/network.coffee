command: 'sh scripts/network'

name: 'network'

refreshFrequency: 15000

update: (output, domEl) ->
  [deviceId, deviceName, _ipAddress, networkName] = output.trim().split("\n")

  if deviceId == 'none'
    @$label().html(@name)
    @$value(0).html(deviceId)
  if networkName == 'ethernet'
    @$label().html(networkName)
    @$value(0).html(deviceId)
  else
    @$label().html(deviceName.toLowerCase())
    @$value(0).html(networkName)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
