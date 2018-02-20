command: 'sh ../scripts/spotify_macos.sh'

refreshFrequency: 3000

template: (output) ->
  info = output.split('@')
  title = info[0].trim()
  artist = info[1].trim()
  status =
    if info.length >= 3
      info[2].trim()
    else
      ''
  keyDiv = "<div class='text key'>&nbsp;spotify&nbsp;</div>"
  titleDiv = "<div class='text value'>&nbsp;#{title}&nbsp;</div>"
  artistDiv = "<div class='text value'>&nbsp;#{artist}&nbsp;</div>"
  statusDiv = 
    if status != ''
      "<div class='text value'>&nbsp;#{status}&nbsp;</div>"
    else
      ''
  """
  <div class="container">
    #{keyDiv}
    #{titleDiv}
    #{artistDiv}
    #{statusDiv}
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
    padding: 0 5px 0 0;
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
    margin: 5px 0px 5px 5px;
    background-color: #d2e9dd;
  """

update: (output, domEl) ->
  if output.indexOf('not running') != -1
    $(domEl).hide()
  else
    $(domEl).show()
    $(domEl).html(@template(output))
