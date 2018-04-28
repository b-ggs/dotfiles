refreshFrequency: false

positions: ['left', 'middle', 'right']

items:
  left: [
    { label: 'spotify', valueFields: 3 }
  ]
  middle: [
  ]
  right: [
    { label: 'network', valueFields: 1 }
    { label: 'battery', valueFields: 2 }
    { label: 'keyboard', valueFields: 1 }
    { label: 'trackpad', valueFields: 1 }
    { label: 'brightness', valueFields: 1 }
    { label: 'volume', valueFields: 1 }
    { label: 'time', valueFields: 1 }
  ]

render: (_output) ->
  $background = @background()
  for position in @positions
    $background.append(@buildGroup(position))
  $background.get(0).outerHTML

buildGroup: (position) ->
  $group = @group(position)
  for item in @items[position]
    $group.append(@buildItem(item.label, item.valueFields))
  $group.append(@separator())
  $group

buildItem: (label, valueFields = 1) ->
  $item = @item(label)
  $item.append(@separator())
  $item.append(@label(label))
  for index in [0..valueFields - 1]
    $item.append(@separator())
    $item.append(@value(label, index))
  $item

background: ->
  $("<div class='background'></div>")

group: (position) ->
  $("<div class='group #{position}-group'></div>")

item: (label) ->
  $("<div id='#{label}-item' class='item' style='display: none'>")

label: (label) ->
  $("<div id='#{label}-label' class='label'>#{label}</div>")

value: (label, index) ->
  $("<div id='#{label}-value-#{index}' class='value'>Loading...</div>")

separator: ->
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
    user-select: none

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
