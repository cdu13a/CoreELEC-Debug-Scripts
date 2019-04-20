#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)
#
# Collect remote control configuration information
#
#####################################################
#
# Comand Line Arguments
# -l = Show local only
# -r = Remove stuff that is redundent between debug scripts, and show local only
#
#####################################################

OUTPUTFILE="/storage/remoteinfo.txt"

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


printf "CoreELEC Remote Control Information...\n\n" > $OUTPUTFILE

if [ "$1" != "-r" ]; then 
    fancycat "/etc/os-release" "Missing!"
    fancycat "/proc/device-tree/coreelec-dt-id" "Missing!"
    fancycat "/proc/device-tree/le-dt-id" "Missing!"
    fancycat "/proc/cmdline" "Missing!"
fi

fancycat "/proc/device-tree/meson-ir/status" "Missing!"
fancycat "/proc/device-tree/meson-remote/status" "Missing!"

fancychk "/storage/.config/remote.disable"
fancychk "/flash/remote.disable"
fancycat "/storage/.config/remote.conf"  "Unset by user!"
fancycat "/flash/remote.conf"  "Unset by user!"
fancycat "/storage/.config/lircd.conf"  "Unset by user!"
fancycat "/storage/.config/lirc_options.conf"  "Unset by user!"
fancycat "/storage/.config/rc_maps.cfg"  "Unset by user!"
fancycatdir "/storage/.config/rc_keymaps" "*"
fancycat "/storage/.kodi/userdata/Lircmap.xml"  "Unset by user!"
fancycat "/storage/.kodi/userdata/keyboard.xml"  "Unset by user!"
fancycatdir "/storage/.kodi/userdata/keymaps" "*.xml"

if [ "$1" != "-r" ]; then 
    fancycat "/storage/.config/autostart.sh" "Unset by user!"
fi

if [ "$1" = "-l" ] || [ "$1" = "-r" ]; then                                                                   
  cat $OUTPUTFILE                                                       
else                              
  paste $OUTPUTFILE                                                                
fi      
