#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

while [ $n -ne $c ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-4 -n 1)
   D=`date -Iseconds`
   case "$I" in
      "1") echo "$D ERROR some critical event here."
      ;;
      "2") echo "$D INFO we made some important task."
      ;;
      "3") echo "$D WARN this method not implemented."
      ;;
      "4") echo "$D DEBUG code 22, array:[\"rotoro\",\"cloud\"]."
      ;;
   esac
   c=$(( c+1 ))
done
