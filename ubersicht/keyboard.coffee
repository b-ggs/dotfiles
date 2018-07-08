command: 'sh scripts/magic_keyboard_battery'

name: 'keyboard'

refreshFrequency: 3000

update: (output, domEl) ->
  data = output.trim()
  if data == 'not available'
    @$item().hide()
    return ''
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