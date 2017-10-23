#!/bin/bash

base="WGL-"
tld="wegolook.com"
serial=ioreg -c IOPlatformExpertDevice -d 2 | awk -F\" '/IOPlatformSerialNumber/{print $(NF-1)}'
/usr/sbin/scutil --set ComputerName $base$serial
/usr/sbin/scutil --set LocalHostName $base$serial
/usr/sbin/scutil --set HostName $base$serial.tld