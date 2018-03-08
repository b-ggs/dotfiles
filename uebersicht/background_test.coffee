refreshFrequency: false

items:
  left:
    contents: [
    ]
  middle:
    contents: [
    ]

items: [
  'Spotify'
  'Battery'
  'Network'
]

render: (output) ->
  templates = @items.map((name, index) => @itemTemplate(name, index))
  """
  <div class="background">
    <div class="group left-group">
      #{templates.join('')}
    </div>
    <div class="group middle-group">
      #{templates.join('')}
    </div>
    <div class="group right-group">
      #{templates.join('')}
    </div>
  </div>
  """

style:
  """
  $bgColor = #2b2b2b
  $labelBgColor = #ffa3c1
  $valueBgColor = #d2e9dd

  $labelTextColor = $bgColor
  $valueTextColor = $bgColor
  $font = 14px "Iosevka Term"

  $barHeight = 30px
  $windowGap = 10px

  $zIndex = 2

  display: flex
  top: $windowGap
  width: 100%
  font: $font

  .background
    background-color: $bgColor
    display: flex
    height: $barHeight
    justify-content: space-between
    margin: 0 $windowGap 0 $windowGap
    width: 100%
    z-index: $zIndex

  .group
    display: flex
    background-color: $bgColor
    display: flex
    height: $barHeight

  .item
    display: flex

  .label
  .separator
  .value
    align-self: center

  .label
    background-color: $labelBgColor
    color: $labelTextColor

  .value
    background-color: $valueBgColor
    color: $valueTextColor

  .label:before
  .label:after
  .value:before
  .value:after
    content: " "
    white-space: pre

  .separator:after
    content: " "
    white-space: pre
  """

itemTemplate: (name, index) ->
  idPrefix = name.toLowerCase()
  """
  <div id="#{idPrefix}-item" class="item">
    <div class="separator"></div>
    <div id="#{idPrefix}-label" class="label">#{name}</div>
    <div class="separator"></div>
    <div id="#{idPrefix}-value" class="value">test</div>
    <div class="separator"></div>
  </div>
  """
