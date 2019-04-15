#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)
#
# Collect amlogic display information
#
#####################################################


OUTPUTFILE="/storage/audinfo.txt"

printf "CoreELEC audio information...\n\n" > $OUTPUTFILE

    printf "------------ /etc/os-release ------------" >> $OUTPUTFILE
if [ -f /etc/os-release ]; then
    printf "\n" >> $OUTPUTFILE
    cat /etc/os-release >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /proc/device-tree/coreelec-dt-id ------------" >> $OUTPUTFILE
if [ -f /proc/device-tree/coreelec-dt-id ]; then
    printf "\n" >> $OUTPUTFILE
    cat /proc/device-tree/coreelec-dt-id >> $OUTPUTFILE
    printf "\n" >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /proc/device-tree/le-dt-id ------------" >> $OUTPUTFILE
if [ -f /proc/device-tree/le-dt-id ]; then
    printf "\n" >> $OUTPUTFILE
    cat /proc/device-tree/le-dt-id >> $OUTPUTFILE
    printf "\n" >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /proc/cmdline ------------" >> $OUTPUTFILE
if [ -f /proc/cmdline ]; then
    printf "\n" >> $OUTPUTFILE
    cat /proc/cmdline >> $OUTPUTFILE
    printf "\n" >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/edid_parsing ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/edid_parsing ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/edid_parsing >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/rawedid ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/rawedid ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/rawedid >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/config ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/config ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/config >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/aud_cap ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/aud_cap ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/aud_cap >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/class/sound ------------" >> $OUTPUTFILE
if [ -d /sys/class/sound ]; then
    printf "\n" >> $OUTPUTFILE
    ls /sys/class/sound >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ relevant kodi settings ------------" >> $OUTPUTFILE
if [ -f /storage/.kodi/userdata/guisettings.xml ]; then
    printf "\n" >> $OUTPUTFILE
    for tag in "accessibility.audiohearing" \
               "accessibility.audiovisual" \
               "accessibility.subhearing" \
               "audiooutput.ac3passthrough" \
               "audiooutput.ac3transcode" \
               "audiooutput.atempothreshold" \
               "audiooutput.audiodevice" \
               "audiooutput.boostcenter" \
               "audiooutput.channels" \
               "audiooutput.config" \
               "audiooutput.dtshdpassthrough" \
               "audiooutput.dtspassthrough" \
               "audiooutput.eac3passthrough" \
               "audiooutput.guisoundmode" \
               "audiooutput.maintainoriginalvolume" \
               "audiooutput.passthrough" \
               "audiooutput.passthroughdevice" \
               "audiooutput.processquality" \
               "audiooutput.samplerate" \
               "audiooutput.audiooutput.stereoupmix" \
               "audiooutput.audiooutput.streamnoise" \
               "audiooutput.audiooutput.streamsilence" \
               "audiooutput.truehdpassthrough" \
               "audiooutput.volumesteps" \
               "musicplayer.replaygainavoidclipping" \
               "musicplayer.replaygainnogainpreamp" \
               "musicplayer.replaygainpreamp" \
               "musicplayer.replaygaintype" \
               "musicplayer.seekdelay" \
               "musicplayer.seeksteps"
    do
        printf "$tag: " >> $OUTPUTFILE
        cat /storage/.kodi/userdata/guisettings.xml |grep \""$tag"\" |grep -o '>.*<' |sed -E 's/[<>]//g' >> $OUTPUTFILE
    done
    printf "mute: " >> $OUTPUTFILE
    cat /storage/.kodi/userdata/guisettings.xml |grep mute |grep -o '>.*<' |sed -E 's/[<>]//g' >> $OUTPUTFILE
    printf "volumelevel: " >> $OUTPUTFILE
    cat /storage/.kodi/userdata/guisettings.xml |grep fvolumelevel |grep -o '>.*<' |sed -E 's/[<>]//g' >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/sound.conf ------------" >> $OUTPUTFILE
if [ -f /storage/.config/sound.conf ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/sound.conf >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/asound.conf ------------" >> $OUTPUTFILE
if [ -f /storage/.config/asound.conf ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/asound.conf >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/pulse-daemon.conf.d ------------" >> $OUTPUTFILE
if [ -d /storage/.config/pulse-daemon.conf.d ]; then
    printf "\n" >> $OUTPUTFILE
    ls /storage/.config/pulse-daemon.conf.d >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/autostart.sh ------------" >> $OUTPUTFILE
if [ -f /storage/.config/autostart.sh ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/autostart.sh >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi

if [ "$1" = "-l" ]; then                                                                   
  cat $OUTPUTFILE                                                       
else                              
  paste $OUTPUTFILE                                                                
fi      
