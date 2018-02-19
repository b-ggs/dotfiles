command: 'sh ../scripts/network_macos.sh'

refreshFrequency: 15000

render: (output) ->
  info = output.split('@')
  iface = info[0].toLowerCase()
  id = info[1]
  """
  <div class="container">
    <div class='text key'>&nbsp;#{iface.trim()}&nbsp;</div>
    <div class='text value'>&nbsp;#{id.trim()}&nbsp;</div>
  </div>
  """

style:
  """
  display: flex;
  justify-content: flex-start;
  top: 10px;

  .container
    margin: 0 0 0 10px;
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
