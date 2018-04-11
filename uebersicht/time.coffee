command: 'sh ../scripts/time_unix.sh'

name: 'time'

refreshFrequency: 60000

update: (output, domEl) ->
  @$value(0).html(output.trim())
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
