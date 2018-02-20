command: 'sh ../scripts/spotify_macos.sh'

refreshFrequency: 3000

label: 'spotify'

render: (output) ->
  json = JSON.parse(output)
  if json.state == 'not running'
    return ''
  keyDiv = "<div class='text label'>&nbsp;#{@label}&nbsp;</div>"
  titleDiv = "<div class='text value'>&nbsp;#{json.title}&nbsp;</div>"
  artistDiv = "<div class='text value'>&nbsp;#{json.artist}&nbsp;</div>"
  statusDiv =
    if json.state != 'playing'
      "<div class='text value'>&nbsp;#{json.state}&nbsp;</div>"
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

  .label
    align-self: center;
    margin: 5px 0px 5px 5px;
    background-color: #ffa3c1;

  .value
    align-self: center;
    margin: 5px 0px 5px 5px;
    background-color: #d2e9dd;
  """
