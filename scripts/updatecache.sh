#!/bin/bash

currentfile = $(python ~/gitrepos/edhcarddealer/edhapi.py)

if [[ "$(cat ~/gitrepos/edhcarddealer/cache/bulkver.txt)" == "$currentfile" ]]; then
  rm ~/gitrepos/edhcarddealer/cache/bulkver.txt
  echo "$currentfile" >> ~/gitrepos/edhcarddealer/cache/bulkver.txt
  wget -c "$currentfile" -O ~/gitrepos/edhcarddealer/cache/oracle-cards.json
fi
