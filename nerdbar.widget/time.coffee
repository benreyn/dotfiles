command: "date +\"%l:%M%p\""

refreshFrequency: 10000 # ms

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #458588
  font: 14px Menlo
  font-weight: bold
  right: 12px
  top: 6px
"""
