#!/bin/bash
NETWORK=$1

IFS='.'; subs=($NETWORK); unset IFS;

case ${#subs[@]} in
	0)
		echo You gotta give me something mate
		;;
	1)
		SUB1=${subs[0]}
		for SUB2 in {1..255}
		do
			for SUB3 in {1..255} 
			do
				for SUB4 in {1..255} 
				do
					arping -c 3 -I $2 $SUB1"."$SUB2"."$SUB3"."$SUB4 2> /dev/null
				done
			done
		done
		;;
	2)
		SUB1=${subs[0]}
		SUB2=${subs[1]}
		for SUB3 in {1..255}
		do
			for SUB4 in {1..255}
			do
				arping -c 3 -I $2 $SUB1"."$SUB2"."$SUB3"."$SUB4 2> /dev/null
			done
		done
		;;
	3)
		SUB1=${subs[0]}
		SUB2=${subs[1]}
		SUB3=${subs[2]}
		for SUB4 in {1..255}
		do 
			arping -c 3 -I $2 $SUB1"."$SUB2"."$SUB3"."$SUB4 2> /dev/null
		done	  
		;;
	4)

		SUB1=${subs[0]}
		SUB2=${subs[1]}
		SUB3=${subs[2]}
		SUB4=${subs[3]}
		arping -c 3 -I $2 $SUB1"."$SUB2"."$SUB3"."$SUB4 2> /dev/null
		;;
	*)
		echo IPv4 pls
esac
