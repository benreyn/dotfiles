command: "pmset -g batt | egrep '([0-9]+\%).*' -o --colour=auto | cut -f1 -d';'"

refreshFrequency: 150000 # ms

render: (output) ->
  "BAT #{output}"

style: """
  -webkit-font-smoothing: antialiased
  font: 14px Menlo
  font-weight: bold
  top: 6px
  right: 170px
  color: #FFCC66
"""
