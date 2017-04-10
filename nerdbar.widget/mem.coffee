command: "ESC=`printf \"\e\"`; ps -A -o %mem | awk '{s+=$1} END {print \"\" s}'"

refreshFrequency: 30000 # ms

render: (output) ->
  "MEM <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #D5C4A1
  font: 14px Menlo
  font-weight: bold
  right: 235px
  top: 6px
  span
    color: #9C9486
"""
