#!/bin/bash

nohup google-chrome https://hangouts.google.com/ &
nohup google-chrome https://docs.google.com/spreadsheets/d/1E3IjOpmAmp7lpS6bED1JVCY2Fgj2KAPe6alYlbZ5BJM/edit#gid=0 &
nohup google-chrome https://music.youtube.com &
nohup google-chrome https://blinking.atlassian.net/jira/your-work &

cd ~/Projects/mailer-node
code .

echo "The day has officialy begun"
date

