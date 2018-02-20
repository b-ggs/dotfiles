refreshFrequency: false

render: (output) ->
  """
  <div class="container">foo</div>
  """

style:
  """
  display: flex;
  justify-content: center;
  width: 100%;
  top: 10px;

  .container
    width: 100%
    background-color: #2b2b2b;
    height: 30px;
    z-index: -1;
    margin: 0 10px 0 10px;
  """
