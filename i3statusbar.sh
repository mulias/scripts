#!/bin/sh
#
# Outputs status bar info, to be piped in to i3bar or other app
#
###


mpd_stat() {
  song=$(mpc current)
  pausetest=$( mpc | sed -n 2p )
  if [[ $pausetest == [paused* ]]; then
    song="[$song]" 
  fi
  echo $song  
}

battery_stat() {
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

sound_stat() {
  sound=$(amixer get Master | grep -o '[0-9]*%')  
  mutetest=$(amixer get Master | grep -o 'off')  
  if [[ $mutetest == 'off' ]]; then  
    sound="[$sound]"  
  fi
  echo $sound
}

ram_stat() {
  ram=$(free | grep Mem | awk '{print $3/$2 * 100}' | sed 's/[.].*$//')
  echo ${ram}%
}

date_stat() {
  echo $(date '+%m/%d | %I:%M')
}

wifi_stat() {
  echo $(iwconfig wlp3s0 | awk '/Quality/{print $2}' | sed 's/.*=//' | awk -F"/" '{printf("%.0f%%", $1/$2*100)}')
}


while :;
do
  echo -n $(mpd_stat) '| Wireless' $(wifi_stat) '| Battery' $(battery_stat) '| Volume' $(sound_stat) '| RAM' $(ram_stat) '|' $(date_stat)
  sleep 1
done
