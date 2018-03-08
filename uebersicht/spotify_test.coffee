command: 'sh ../scripts/spotify_macos.sh'

refreshFrequency: 3000

render: (_output) ->
  ""

update: (output, domEl) ->
  $container = $("#spotify-container")
  $label = $container.find('.label')
  $value = $container.find('.value')
  $label.html(output)
