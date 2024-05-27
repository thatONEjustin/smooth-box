#!/bin/bash
# get_weather.sh

for i in {1..5}; do
	text=$(curl -s "https://wttr.in/$1?format=3")
	if [[ $? == 0 ]]; then
		text=$(echo "$text" | sed -E "s/\s+/ /g")
		if [[ $? == 0 ]]; then
			if [[ $text == *"Unknown location"* ]]; then
				echo "{\"text\":\"\"}"
				exit
			else
				echo "{\"text\":\"$text\"}"
				exit
			fi
		fi
	fi
	sleep 2
done
echo "{\"text\":\"error\"}"
