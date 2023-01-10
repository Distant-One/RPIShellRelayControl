#!/bin/bash
# Borrowed heavily from https://simonprickett.dev/controlling-raspberry-pi-gpio-pins-from-bash-scripts-traffic-lights/
# 1st time through requires running with sudo. After that sudo is not requried
# Usage acpower.sh <device name> < ON|OFF|>
# Example:
#  acpower 3926_Water ON
#
# Operation
#  assign device names to relays 1-4
#  assign relaystate ON to 1 and any other state to 0
#  export pin if not already exported
#  set pin as an output
#  set pin state

RELAY="0"
DEVICE=$1
if [ $DEVICE == "3926_Water" ]
then
  #  GPIO 11 Pin 23
  RELAY="11"
fi
if [ $DEVICE == "3926_Damage" ]
then
  #  GPIO 9 Pin 21
  RELAY="9"
fi
if [ $DEVICE == "5160" ]
then
  #  GPIO 10 Pin 21
  RELAY="10"
fi
if [ $DEVICE == "CC5164" ]
then
  #  GPIO 22 Pin 15
  RELAY="22"
fi
echo "RELAY set to $RELAY"

POWERCOMMAND=$2
if [ $POWERCOMMAND == "ON" ]
then
  STATE="1"
else
  STATE="0"
fi
ON="1"
OFF="0"

# Common path for all GPIO access
BASE_GPIO_PATH=/sys/class/gpio
echo "$BASE_GPIO_PATH"

# Utility function to export a pin if not already exported
exportPin()
{
  echo "Utility function to export a pin $1 if not already exported"
  if [ ! -e $BASE_GPIO_PATH/gpio$1 ]; then
    echo "$1" > $BASE_GPIO_PATH/export
  fi
}
# Utility function to set a pin as an output
setOutput()
{
  echo "Utility function to set a pin $1 as an output"
  echo "out" > $BASE_GPIO_PATH/gpio$1/direction
}

# Utility function to change state of a AC relay
setRelayState()
{
  echo "Utility function to change state of a AC relay $1 to $2"
  echo $2 > $BASE_GPIO_PATH/gpio$1/value
}

# Utility function to turn all AC relays off
allRelaysOff()
{
  echo "Utility function to turn all AC relays off"
  setRelayState "11" $OFF
  setRelayState "9" $OFF
  setRelayState "10" $OFF
  setRelayState "22" $OFF
}

# Ctrl-C handler for clean shutdown
shutdown()
{
  allRelaysOff
  exit 0
}

trap shutdown SIGINT

# Export pins so that we can use them
exportPin "11"
exportPin "9"
exportPin "10"
exportPin "22"

if [ $RELAY == "0" ]
then
  allRelaysOff
  exit 0
fi

# Set pins as outputs
setOutput $RELAY

setRelayState $RELAY $STATE

while [ 1 ]
do
  setRelayState "11" "1"
  sleep 3
  setRelayState "9" "1"
  sleep 3
  setRelayState "10" "1"
  sleep 3
  setRelayState "22" "1"
  sleep 3
  setRelayState "11" "0"
  sleep 3
  setRelayState "9" "0"
  sleep 3
  setRelayState "10" "0"
  sleep 3
  setRelayState "22" "0"
  sleep 3
done

