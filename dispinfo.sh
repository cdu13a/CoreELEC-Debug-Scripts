#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)
#
# Collect amlogic display information
#
#####################################################


OUTPUTFILE="/storage/dispinfo.txt"

printf "CoreELEC display information...\n\n" > $OUTPUTFILE

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
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/edid ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/edid ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/edid >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
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
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/dc_cap ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/dc_cap ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/dc_cap >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/attr ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/attr ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/attr >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/disp_cap ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/disp_cap ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/disp_cap >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/preferred_mode ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/preferred_mode ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/preferred_mode >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/devices/virtual/amhdmitx/amhdmitx0/hdr_cap ------------" >> $OUTPUTFILE
if [ -f /sys/devices/virtual/amhdmitx/amhdmitx0/hdr_cap ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/devices/virtual/amhdmitx/amhdmitx0/hdr_cap >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/module/am_vecm/parameters/hdr_mode ------------" >> $OUTPUTFILE
if [ -f /sys/module/am_vecm/parameters/hdr_mode ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/module/am_vecm/parameters/hdr_mode >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/module/am_vecm/parameters/sdr_mode ------------" >> $OUTPUTFILE
if [ -f /sys/module/am_vecm/parameters/sdr_mode ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/module/am_vecm/parameters/sdr_mode >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /sys/class/display/vinfo ------------" >> $OUTPUTFILE
if [ -f /sys/class/display/vinfo ]; then
    printf "\n" >> $OUTPUTFILE
    cat /sys/class/display/vinfo >> $OUTPUTFILE
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ relevant kodi settings ------------" >> $OUTPUTFILE
if [ -f /storage/.kodi/userdata/guisettings.xml ]; then
    printf "\n" >> $OUTPUTFILE
    for tag in "coreelec.amlogic.limit8bit" \
               "coreelec.amlogic.force422" \
               "coreelec.amlogic.deinterlacing" \
               "coreelec.amlogic.noisereduction" \
               "coreelec.amlogic.hdr2sdr" \
               "coreelec.amlogic.sdr2hdr" \
               "videoplayer.adjustrefreshrate" \
               "videoplayer.useamcodec" \
               "videoplayer.useamcodech264" \
               "videoplayer.useamcodecmpeg2" \
               "videoplayer.useamcodecmpeg4" \
               "videoplayer.usedisplayasclock" \
               "videoscreen.whitelist" \
               "lookandfeel.skin" 
    do
        printf "$tag: " >> $OUTPUTFILE
        cat /storage/.kodi/userdata/guisettings.xml |grep \""$tag"\" |grep -o '>.*<' |sed -E 's/[<>]//g' >> $OUTPUTFILE
    done
else
    printf " Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.kodi/userdata/disp_cap ------------" >> $OUTPUTFILE
if [ -f /storage/.kodi/userdata/disp_cap ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.kodi/userdata/disp_cap >> $OUTPUTFILE
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
