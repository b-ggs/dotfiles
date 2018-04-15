command: 'sh scripts/network'

name: 'network'

refreshFrequency: 15000

update: (output, domEl) ->
  data = JSON.parse(output)
  if data.device_id == 'none'
    @$label().html(@name)
    @$value(0).html(data.device_id)
  if data.network_name == 'ethernet'
    @$label().html(data.network_name)
    @$value(0).html(data.device_id)
  else
    @$label().html(data.device_name.toLowerCase())
    @$value(0).html(data.network_name)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
