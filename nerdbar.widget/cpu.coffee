command: "ESC=`printf \"\e\"`; ps -A -o %cpu | awk '{s+=$1} END {printf(\"%.2f\",s/8);}'"

refreshFrequency: 2000 # ms

render: (output) ->
  "CPU <span>#{output}</span>"

style: """
  -webkit-font-smoothing: antialiased
  color: #D5C4A1
  font: 14px Menlo
  font-weight: bold
  right: 315px
  top: 6px
  span
    color: #7AAB7E
"""
