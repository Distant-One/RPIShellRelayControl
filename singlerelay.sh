#!/bin/bash
# Borrowed heavily from https://simonprickett.dev/controlling-raspberry-pi-gpio-pins-from-bash-scripts-traffic-lights/
# 1st time through requires running with sudo. After that sudo is not requried

POWERCOMMAND=$1

# Common path for all GPIO access
BASE_GPIO_PATH=/sys/class/gpio
echo "$BASE_GPIO_PATH"

# Assign names to GPIO pin numbers for each AC relay
# Relay1 is connected to GPIO 11 on header pin 23
RELAY1="11"
# Assign Device Relay
AC5160_AC5164CC="$RELAY1"

# Assign names to states
ON="1"
OFF="0"

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
  echo "setLightState $AC5160_AC5164CC $OFF"
  setRelayState $AC5160_AC5164CC $OFF
}

# Ctrl-C handler for clean shutdown
shutdown()
{
  allRelaysOff
  exit 0
}

trap shutdown SIGINT

# Export pins so that we can use them
exportPin $AC5160_AC5164CC

# Set pins as outputs
setOutput $AC5160_AC5164CC


POWERCOMMAND=$1

if [ $POWERCOMMAND == "ON" ]
then
  setRelayState $AC5160_AC5164CC $ON
else
  setRelayState $AC5160_AC5164CC $OFF
fi
