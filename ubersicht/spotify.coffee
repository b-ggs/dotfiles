command: 'sh scripts/spotify_status'

name: 'spotify'

refreshFrequency: 10000

update: (output, domEl) ->
  [state, title, artist, _album] = output.trim().split("\n")

  if state  == 'not running'
    @$item().hide()
    return ''

  @$value(0).html(title)
  @$value(1).html(artist)

  if state != 'playing'
    @$value(2).html(state)
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
  ''
