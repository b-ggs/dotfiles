command: 'sh ../scripts/network_macos.sh'

refreshFrequency: 15000

render: (output) ->
  json = JSON.parse(output)
  """
  <div class="container">
    <div class='text key'>&nbsp;#{json.interface}&nbsp;</div>
    <div class='text value'>&nbsp;#{json.network_id}&nbsp;</div>
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