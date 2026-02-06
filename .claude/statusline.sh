#!/usr/bin/env bash

input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "Unknown"')
pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0')
cost=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')

# Progress bar (10 chars wide)
filled=$(printf "%.0f" "$(echo "$pct / 10" | bc -l)" 2>/dev/null || echo 0)
[ "$filled" -gt 10 ] 2>/dev/null && filled=10
[ "$filled" -lt 0 ] 2>/dev/null && filled=0

bar=""
for ((i=0; i<10; i++)); do
  if [ "$i" -lt "$filled" ]; then
    bar+="█"
  else
    bar+="░"
  fi
done

pct_display=$(printf "%.0f%%" "$pct")
cost_display=$(printf "$%.2f" "$cost")

printf "%s │ %s %s │ %s" "$model" "$bar" "$pct_display" "$cost_display"
