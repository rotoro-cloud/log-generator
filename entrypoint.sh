#!/bin/sh
n=-1
c=0
if [ -n "$3" ]
then
   n=$3
fi

SYSUSER="root"
APPUSER="logger"

if [ -z "${OVERRIDE_USER}" ]; then
  OVERRIDE_MSG="INFO - USER5 account LOCKED due to Many Failed Attempts"
else
  OVERRIDE_MSG="WARN - ${OVERRIDE_USER} Item OUT OF STOCK"
fi

while [ $n -ne $c ]
do
   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-9 -n 1)
   D=`date -Iseconds`
   USER=$(shuf -i 1-4 -n 1)
   case "$I" in
      "1") echo "$D - $SYSUSER - ERROR - USER$USER critical error in input in file index.php at line 22"
      ;;
      "2") echo "$D - $APPUSER - WARN - USER$USER the method not implemented"
      ;;
      "3") echo "$D - $APPUSER - DEBUG - USER$USER code 22, array:[\"rotoro\",\"cloud\"]"
      ;;
      "4") echo "$D - $APPUSER - INFO - USER$USER logged in"
      ;;
      "5") echo "$D - $APPUSER - INFO - USER$USER logged out"
      ;;
      "6") echo "$D - $APPUSER - INFO - USER$USER viewing page1"
      ;;
      "7") echo "$D - $APPUSER - INFO - USER$USER viewing page2"
      ;;
      "8") echo "$D - $APPUSER - INFO - USER$USER viewing landing page"
      ;;
      "9") echo "$D - $APPUSER - ${OVERRIDE_MSG}"
      ;;
   esac
   c=$(( c+1 ))
done
