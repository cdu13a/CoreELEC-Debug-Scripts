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
#
#####################################################

OUTPUTFILE="/storage/ce-debug_info.txt"

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


printf "CoreELEC Debug Information...\n\n" > $OUTPUTFILE

fancycat "/etc/os-release" "Missing!"
fancycat "/proc/device-tree/coreelec-dt-id" "Missing!"
fancycat "/proc/device-tree/le-dt-id" "Missing!"
fancycat "/proc/cmdline" "Missing!"
fancycat "/flash/boot.ini"  "Missing!"
fancycat "/flash/config.ini"  "Missing!"
fancycat "/storage/.config/autostart.sh" "Unset by user!"

printf "\n" >> $OUTPUTFILE
if [ -x ./dispinfo.sh ]; then
    ./dispinfo.sh -r >> $OUTPUTFILE
else
    dispinfo -r >> $OUTPUTFILE
fi

printf "\n" >> $OUTPUTFILE
if [ -x ./remoteinfo.sh ]; then
    ./remoteinfo.sh -r >> $OUTPUTFILE
else
    remoteinfo -r >> $OUTPUTFILE
fi

printf "\n" >> $OUTPUTFILE
if [ -x ./audinfo.sh ]; then
    ./audinfo.sh -r >> $OUTPUTFILE
else
    audinfo -r >> $OUTPUTFILE
fi


if [ "$1" = "-l" ]; then                                                                   
  cat $OUTPUTFILE                                                       
else                              
  paste $OUTPUTFILE                                                                
fi      
