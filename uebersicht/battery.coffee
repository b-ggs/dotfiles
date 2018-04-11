command: 'sh ../scripts/battery_macos.sh'

name: 'battery'

refreshFrequency: 15000

update: (output, domEl) ->
  parsedOutput = JSON.parse(output)
  @$value(0).html("#{parsedOutput.percentage} (#{parsedOutput.remaining})")
  @$value(1).html(parsedOutput.status)
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
