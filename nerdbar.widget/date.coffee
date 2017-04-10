command: "date +\"%a %d %b\""

refreshFrequency: 10000

render: (output) ->
  "#{output}"

style: """
  -webkit-font-smoothing: antialiased
  color: #C88193
  font: 15px Menlo
  font-weight: bold
  right: 70px
  top: 6px
"""
