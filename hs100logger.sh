#!/bin/bash
delay=$3

echo "Date, Current, Voltage, Power, Total" >> log.csv
i=0
while (true); do
  ((i++))
  echo "Recording $i"
  TEST="$(bash ./hs100.sh $1 $2 emeter)"
  CURRENT=`echo $TEST | python -c "import sys, json; print json.load(sys.stdin)['emeter']['get_realtime']['current']"`
  VOLTAGE=`echo $TEST | python -c "import sys, json; print json.load(sys.stdin)['emeter']['get_realtime']['voltage']"`
  POWER=`echo $TEST | python -c "import sys, json; print json.load(sys.stdin)['emeter']['get_realtime']['power']"`
  TOTAL=`echo $TEST | python -c "import sys, json; print json.load(sys.stdin)['emeter']['get_realtime']['total']"`
  echo "Current: $CURRENT, Voltage: $VOLTAGE, Power: $POWER, TOTAL: $TOTAL"
  echo "`date '+%Y-%m-%d %H:%M:%S'`, $CURRENT, $VOLTAGE, $POWER, $TOTAL" >> log.csv
  sleep $delay
done
