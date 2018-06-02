command: 'sh scripts/volume'

name: 'volume'

refreshFrequency: 3000

update: (output, domEl) ->
  [output, _input, _alert, isMuted] = output.trim().split("\n")

  if isMuted == 'true'
    @$value(0).html('muted')
  else
    @$value(0).html(output)

  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ''
