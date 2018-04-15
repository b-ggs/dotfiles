command: 'sh ../scripts/battery'

name: 'battery'

refreshFrequency: 15000

update: (output, domEl) ->
  parsedOutput = JSON.parse(output)
  if parsedOutput.battery_present == 'false'
    @$item().hide()
    return
  if parsedOutput.time_remaining == '0:00'
    percentValue = parsedOutput.percent
  else
    percentValue = "#{parsedOutput.percent} (#{parsedOutput.remaining})"
  @$value(0).html(percentValue)
  @$value(1).html(parsedOutput.state)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
