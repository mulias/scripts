#!/bin/sh
#
# Outputs status bar info, to be piped in to i3bar or other app
#
###


mpd_status() {
  song=$(mpc current)
  pausetest=$( mpc | sed -n 2p )
  if [[ $pausetest == [paused* ]]; then
    song="[$song]" 
  fi
  echo $song  
}

battery_status() {
  battery=$(acpi -b | sed -n 's/.*\([0-9][0-9]:[0-9][0-9]\):[0-9][0-9].*/\1/p')
  dischargetest=$(acpi -b | awk '{print $3}')
  if [[ $dischargetest == Discharging* ]]; then
    battery="-$battery"
  elif [[ $dischargetest == Charging* ]]; then
    battery="+$battery"
  elif [[ $dischargetest == Full* ]]; then
    battery="100%"
  elif [[ $dischargetest == Unknown* ]]; then
    battery=$(acpi -b | awk '{print $4}')
  else
    battery="None"
  fi
  echo $battery
}

sound_status() {
  sound=$(amixer get Master | grep -o '[0-9]*%')  
  mutetest=$(amixer get Master | grep -o 'off')  
  if [[ $mutetest == 'off' ]]; then  
    sound="[$sound]"  
  fi
  echo $sound
}

while :;
do
  wireless=$(iwconfig wlp3s0 | awk '/Quality/{print $2}' | sed 's/.*=//' | awk -F"/" '{printf("%.0f%%", $1/$2*100)}')
  ram=$(free | grep Mem | awk '{print $3/$2 * 100}' | sed 's/[.].*$//')
  date=$(date '+%m/%d | %I:%M')
  echo -n $(mpd_status) '| Wireless' $wireless '| Battery' $(battery_status) '| Volume' $(sound_status) ' | RAM' $ram'%' '|' $date
  sleep 1
done
