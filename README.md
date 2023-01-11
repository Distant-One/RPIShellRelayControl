# RPIShellRelayControl
Relay control using Raspberry Pi and Bash Shell

Remote control of AC Power to devices using rpi and a relay module.  This repository will is for the shell script controlling the GPIO pin on the Raspberry Pi.
1st Version HW tested with RPI3B and Digital Data Logger Controllable Four Outlet Power Relay Module version 2 from Adafruit https://www.adafruit.com/product/2935
RPI3B header Pin 23/GPIO 11 as control output and RPI3B header pin 25 as ground.

newacpower.sh
relay control gpio:
gpio 11 pin 23
gpio 9 pin 21
gpio 10 pin 19
gpio 22 pin 15

