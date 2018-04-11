command: 'sh ../scripts/spotify_macos.sh'

name: 'spotify'

refreshFrequency: 3000

update: (output, domEl) ->
  parsedOutput = JSON.parse(output)
  state = parsedOutput.state
  if state == 'not running'
    @$item().hide()
    return ''
  @$value(0).html(parsedOutput.title)
  @$value(1).html(parsedOutput.artist)
  if state != 'playing'
    @$value(2).html(state)
  else
    @$value(2).hide()
  @$item().show()

$item: ->
  $("##{@name}-item")

$label: ->
  $("##{@name}-label")

$value: (index) ->
  $("##{@name}-value-#{index}")

render: (_output) ->
  ""
