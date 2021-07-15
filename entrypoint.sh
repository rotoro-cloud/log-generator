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

LOG_PATH="/log/"
LOG_FILE="app.log"
mkdir -p ${LOG_PATH} && touch "${LOG_PATH}${LOG_FILE}"
if [ -z "${MAX_LINES}" ]; then
  MAX_LINES=300
else
  MAX_LINES=${MAX_LINES}
fi

while [ $n -ne $c ]
do
   output=""

   WAIT=$(shuf -i $1-$2 -n 1)
   sleep $(echo "scale=4; $WAIT/1000" | bc)
   I=$(shuf -i 1-9 -n 1)
   D=`date -Iseconds`
   USER=$(shuf -i 1-4 -n 1)
   case "$I" in
      "1") output="$D - $SYSUSER - ERROR - USER$USER critical error in input in file index.php at line 22"
      ;;
      "2") output="$D - $APPUSER - WARN - USER$USER the method not implemented"
      ;;
      "3") output="$D - $APPUSER - DEBUG - USER$USER code 22, array:[\"rotoro\",\"cloud\"]"
      ;;
      "4") output="$D - $APPUSER - INFO - USER$USER logged in"
      ;;
      "5") output="$D - $APPUSER - INFO - USER$USER logged out"
      ;;
      "6") output="$D - $APPUSER - INFO - USER$USER viewing page1"
      ;;
      "7") output="$D - $APPUSER - INFO - USER$USER viewing page2"
      ;;
      "8") output="$D - $APPUSER - INFO - USER$USER viewing landing page"
      ;;
      "9") output="$D - $APPUSER - ${OVERRIDE_MSG}"
      ;;
   esac

   echo $output
   echo $output >> "${LOG_PATH}${LOG_FILE}"
   tail -n $MAX_LINES "${LOG_PATH}${LOG_FILE}" > "${LOG_PATH}tmp.log"
   mv "${LOG_PATH}tmp.log" "${LOG_PATH}${LOG_FILE}"

   c=$(( c+1 ))
done
