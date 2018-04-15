refreshFrequency: false

positions: ['left', 'middle', 'right']

items:
  left: [
    { name: 'spotify', valuesCount: 3 }
  ]
  middle: [
  ]
  right: [
    { name: 'network', valuesCount: 1 }
    { name: 'battery', valuesCount: 2 }
    { name: 'keyboard', valuesCount: 1 }
    { name: 'trackpad', valuesCount: 1 }
    { name: 'time', valuesCount: 1 }
  ]

render: (_output) ->
  @$backgroundTemplate().get(0).outerHTML

$backgroundTemplate: ->
  $container = $("<div class='background'></div>")
  for position in @positions
    $container.append(@$groupTemplate(position))
  $container

$groupTemplate: (position) ->
  $container = $("<div class='group #{position}-group'></div>")
  for item in @items[position]
    $container.append(@$itemTemplate(item.name, item.valuesCount))
  $container.append(@$separatorTemplate)
  $container

$itemTemplate: (name, valuesCount = 1) ->
  $container = $("<div id='#{name}-item' class='item' style='display: none'>")
  $container.append(@$separatorTemplate)
  $container.append(@$labelTemplate(name))
  for index in [0..valuesCount- 1]
    $container.append(@$separatorTemplate)
    $container.append(@$valueTemplate(name, index))
  $container

$labelTemplate: (name) ->
  $("<div id='#{name}-label' class='label'>#{name}</div>")

$valueTemplate: (name, index) ->
  $("<div id='#{name}-value-#{index}' class='value'>Loading...</div>")

$separatorTemplate: ->
  $("<div class='separator'></div>")

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
