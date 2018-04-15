command: 'sh scripts/volume'

name: 'volume'

refreshFrequency: 3000

update: (output, domEl) ->
  data = JSON.parse(output)
  if data.is_muted == 'true'
    @$value(0).html('muted')
    return ''
  @$value(0).html(data.output_volume)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
