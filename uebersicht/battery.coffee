command: 'sh ../scripts/battery_macos.sh'

refreshFrequency: 10000

render: (output) ->
  info = output.split(' ')
  """
  <div class="container">
    <div class='text key'>&nbsp;battery&nbsp;</div>
    <div class='text value'>&nbsp;#{info.join(' ').trim()}&nbsp;</div>
  </div>
  """

style:
  """
  display: flex;
  justify-content: flex-end;
  width: 100%;
  top: 10px;

  .container
    margin: 0 10px 0 0;
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
