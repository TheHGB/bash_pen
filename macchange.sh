#!/bin/bash
#MAC changer thought to be periodical, using cron or any other tool
#This script is completely useless since macchanger -r <interface> does the same thing, but I wanted to practice
#It can go really slow if you run out of entropy (move your cursor or type to generate some) or you can use macchanger -r and stop wasting your time

for i in a b c d e f
do
	eval $i=$(hexdump -n 1 -e '4/4 "%02X"' /dev/random)
done



INTERFACE=$1


ifconfig down $INTERFACE
macchanger --mac=$a':'$b':'$c':'$d':'$e':'$f $INTERFACE
ifconfig up $INTERFACE
