command: 'sh scripts/battery'

name: 'battery'

refreshFrequency: 15000

update: (output, domEl) ->
  [isPresent, percentage, state, timeRemaining] = output.trim().split("\n")

  unless isPresent == 'true'
    @$item().hide()
    return

  if timeRemaining == '0:00'
    percentText = percentage
  else
    percentText = "#{percentage} (#{timeRemaining})"

  @$value(0).html(percentText)
  @$value(1).html(state)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ''
