#!/bin/bash

#
# Usage: macOs 
#
# The base is prepended to the system serial number to form a complete name. 
# If you are also binding to Active Directory, remember that AD hostnames have a 
# character limit. If your base + serial exceeds that limit, the hostname will be
# truncated by AD. 
#
#
base="<set your base here>"
#Set your tld and uncomment, if desired. 
#tld="<set your tld>"
tld="local"
#
#get system serial number and read into var serial
serial=ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}'
#
#set name in three places
#
/usr/sbin/scutil --set ComputerName $base$serial
/usr/sbin/scutil --set LocalHostName $base$serial
/usr/sbin/scutil --set HostName $base$serial.tld
