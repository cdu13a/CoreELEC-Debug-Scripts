#!/bin/bash
#
# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)
#
# Collect remote control configuration information
#
#####################################################


OUTPUTFILE="/storage/remoteinfo.txt"

printf "CoreELEC remote control information...\n\n" > $OUTPUTFILE

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
    printf "------------ /proc/device-tree/meson-ir/status ------------" >> $OUTPUTFILE
if [ -f /proc/device-tree/meson-ir/status ]; then
    printf "\n" >> $OUTPUTFILE
    cat /proc/device-tree/meson-ir/status >> $OUTPUTFILE
    printf "\n" >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /proc/device-tree/meson-remote/status ------------" >> $OUTPUTFILE
if [ -f /proc/device-tree/meson-ir/status ]; then
    printf "\n" >> $OUTPUTFILE
    cat /proc/device-tree/meson-ir/status >> $OUTPUTFILE
    printf "\n" >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/remote.disable ------------" >> $OUTPUTFILE
if [ -f /storage/.config/remote.disable ]; then
    printf " Set by user!\n" >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /flash/remote.disable ------------" >> $OUTPUTFILE
if [ -f /flash/remote.disable ]; then
    printf " Set by user!\n" >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/remote.conf ------------" >> $OUTPUTFILE
if [ -f /storage/.config/remote.conf ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/remote.conf >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /flash/remote.conf ------------" >> $OUTPUTFILE
if [ -f /flash/remote.conf ]; then
    printf "\n" >> $OUTPUTFILE
    cat /flash/remote.conf >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/lircd.conf ------------" >> $OUTPUTFILE
if [ -f /storage/.config/lircd.conf ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/lircd.conf >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/lirc_options.conf ------------" >> $OUTPUTFILE
if [ -f /storage/.config/lirc_options.conf ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/lirc_options.conf >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/rc_maps.cfg ------------" >> $OUTPUTFILE
if [ -f /storage/.config/rc_maps.cfg ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.config/rc_maps.cfg >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.config/rc_keymaps/* ------------" >> $OUTPUTFILE
if [ -d /storage/.config/rc_keymaps ]; then
    printf "\n" >> $OUTPUTFILE
    for filename in /storage/.config/rc_keymaps/*; do
        [ -e "$filename" ] || continue
        printf "------------ $filename ------------" >> $OUTPUTFILE
        if [ -f $filename ]; then
            printf "\n" >> $OUTPUTFILE
            cat $filename >> $OUTPUTFILE
        else
            printf " is Directory!\n" >> $OUTPUTFILE
        fi
    done
else
    printf " Directory Missing!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.kodi/userdata/Lircmap.xml ------------" >> $OUTPUTFILE
if [ -f /storage/.kodi/userdata/Lircmap.xml ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.kodi/userdata/Lircmap.xml >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.kodi/userdata/keyboard.xml ------------" >> $OUTPUTFILE
if [ -f /storage/.kodi/userdata/keyboard.xml ]; then
    printf "\n" >> $OUTPUTFILE
    cat /storage/.kodi/userdata/keyboard.xml >> $OUTPUTFILE
else
    printf " Unset by user!\n" >> $OUTPUTFILE
fi
    printf "------------ /storage/.kodi/userdata/keymaps/*.xml ------------" >> $OUTPUTFILE
if [ -d /storage/.kodi/userdata/keymaps ]; then
    printf "\n" >> $OUTPUTFILE
    for filename in /storage/.kodi/userdata/keymaps/*.xml; do
        [ -e "$filename" ] || continue
        printf "------------ $filename ------------" >> $OUTPUTFILE
        if [ -f $filename ]; then
            printf "\n" >> $OUTPUTFILE
            cat $filename >> $OUTPUTFILE
        else
            printf " is Directory!\n" >> $OUTPUTFILE
        fi
    done
else
    printf " Directory Missing!\n" >> $OUTPUTFILE
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
