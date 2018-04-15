command: 'sh ../scripts/spotify_status'

name: 'spotify'

refreshFrequency: 3000

update: (output, domEl) ->
  data = JSON.parse(output)
  if data.state == 'not running'
    @$item().hide()
    return ''
  @$value(0).html(data.title)
  @$value(1).html(data.artist)
  if data.state != 'playing'
    @$value(2).html(data.state)
    @$value(2).show()
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
