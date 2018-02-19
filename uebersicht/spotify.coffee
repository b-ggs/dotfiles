command: 'sh ../scripts/spotify_macos.sh'

refreshFrequency: 3000

template: (output) ->
  """
  <div class="container">
    <div class='text key'>&nbsp;spotify&nbsp;</div>
    <div class='text value'>&nbsp;#{output.trim()}&nbsp;</div>
  </div>
  """

render: (output) ->
  @template(output)

style:
  """
  display: flex;
  justify-content: center;
  width: 100%;
  top: 10px;

  .container
    display: flex;
    height: 30px;
    background-color: #2b2b2b;

  .text
    font-family: Iosevka Term;
    font-size: 14px;
    color: #2b2b2b;

  .key
    align-self: center;
    margin: 5px 0px 5px 5px;
    background-color: #ffa3c1;

  .value
    align-self: center;
    margin: 5px 5px 5px 5px;
    background-color: #d2e9dd;
  """

update: (output, domEl) ->
  if output.indexOf('Spotify is') != -1
    $(domEl).hide()
  else
    $(domEl).show()
    $(domEl).html(@template(output))
