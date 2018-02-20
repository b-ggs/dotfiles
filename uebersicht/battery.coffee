command: 'sh ../scripts/battery_macos.sh'

refreshFrequency: 10000

label: 'battery'

render: (output) ->
  json = JSON.parse(output)
  keyDiv = "<div class='text key'>&nbsp;#{@label}&nbsp;</div>"
  percentageDiv = "<div class='text value'>&nbsp;#{json.percentage}&nbsp;</div>"
  statusDiv = "<div class='text value'>&nbsp;#{json.status}&nbsp;</div>"
  remainingDiv =
    if json.remaining == '' || json.status == 'charged'
      ''
    else
      "<div class='text value'>&nbsp;#{json.remaining} remaining&nbsp;</div>"
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
