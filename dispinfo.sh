#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)
#
# Collect amlogic display information
#
#####################################################
#
# Comand Line Arguments
# -l = Show local only
# -r = Remove stuff that is redundent between debug scripts, and show local only
#
#####################################################

OUTPUTFILE="/storage/dispinfo.txt"

fancycat()
{
# $1 = file $2 = message if file not found
    printf "------------ $1 ------------" >> $OUTPUTFILE
    if [ -f $1 ]; then
        printf "\n" >> $OUTPUTFILE
        cat $1 | tr '\000' '\n' >> $OUTPUTFILE
    else
        printf " $2\n" >> $OUTPUTFILE
    fi

}

fancychk()
{
   printf "------------ $1 ------------" >> $OUTPUTFILE
    if [ -f $1 ]; then
        printf " Set by user!\n" >> $OUTPUTFILE
    else
        printf " Unset by user!\n" >> $OUTPUTFILE
    fi

}

fancycatdir()
{
if [ -d $1 ]; then
    printf "------------ $1 ------------\n" >> $OUTPUTFILE
    for filename in $1/$2
    do
        [ -e $filename ] || continue
        if [ -f $filename ]; then
            fancycat $filename
        fi
    done
else
    printf " Directory Missing!\n"
fi

}


printf "CoreELEC Display Information...\n\n" > $OUTPUTFILE

if [ "$1" != "-r" ]; then 
    fancycat "/etc/os-release" "Missing!"
    fancycat "/proc/device-tree/coreelec-dt-id" "Missing!"
    fancycat "/proc/device-tree/le-dt-id" "Missing!"
    fancycat "/proc/cmdline" "Missing!"
fi
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/edid" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/edid_parsing" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/rawedid" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/config" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/dc_cap" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/attr" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/disp_cap" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/preferred_mode" "Missing!"
fancycat "/sys/devices/virtual/amhdmitx/amhdmitx0/hdr_cap" "Missing!"
fancycat "/sys/module/am_vecm/parameters/hdr_mode" "Missing!"
fancycat "/sys/module/am_vecm/parameters/sdr_mode" "Missing!"
fancycat "/sys/class/display/vinfo" "Missing!"

printf "------------ kodi display settings ------------" >> $OUTPUTFILE
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
        value=$(cat /storage/.kodi/userdata/guisettings.xml |grep "\"$tag\"" |grep -o '>.*<' |sed -E 's/[<>]//g')
        [ -n "$value" ] && printf "$value" >> $OUTPUTFILE
        printf "\n" >> $OUTPUTFILE
    done
else
    printf " Missing!\n" >> $OUTPUTFILE
fi


fancycat "/storage/.kodi/userdata/disp_cap" "Unset by user!"
if [ "$1" != "-r" ]; then 
    fancycat "/flash/boot.ini"  "Missing!"
    fancycat "/flash/config.ini"  "Missing!"
    fancycat "/storage/.config/autostart.sh" "Unset by user!"
fi

if [ "$1" = "-l" ] || [ "$1" = "-r" ]; then                                                                   
  cat $OUTPUTFILE                                                       
else                              
  paste $OUTPUTFILE                                                                
fi      
