command: 'sh ../scripts/brightness'

name: 'brightness'

refreshFrequency: 3000

update: (output, domEl) ->
  data = output.trim()
  @$value(0).html(data)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
