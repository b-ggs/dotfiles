command: 'sh ../scripts/network_macos.sh'

name: 'network'

refreshFrequency: 15000

update: (output, domEl) ->
  parsedOutput = JSON.parse(output)
  @$label().html(parsedOutput.interface.toLowerCase())
  @$value(0).html(parsedOutput.network_id)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
