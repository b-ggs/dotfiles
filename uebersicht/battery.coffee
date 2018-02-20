command: 'sh ../scripts/battery_macos.sh'

refreshFrequency: 10000

render: (output) ->
  info = output.split('@')
  status = info[0].trim()
  percentage = info[1].trim()
  remaining =
    if info[2].indexOf('no') == -1
      "#{info[2].trim()} remaining"
    else
      ''
  keyDiv = "<div class='text key'>&nbsp;battery&nbsp;</div>"
  percentageDiv = "<div class='text value'>&nbsp;#{percentage}&nbsp;</div>"
  statusDiv = "<div class='text value'>&nbsp;#{status}&nbsp;</div>"
  remainingDiv =
    if remaining != ''
      "<div class='text value'>&nbsp;#{remaining}&nbsp;</div>"
    else
      ''
  """
  <div class="container">
    #{keyDiv}
    #{percentageDiv}
    #{statusDiv}
    #{remainingDiv}
  </div>
  """

style:
  """
  display: flex;
  justify-content: flex-end;
  width: 100%;
  top: 10px;
  right: 10px;

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
