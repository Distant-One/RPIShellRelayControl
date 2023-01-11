# RPIShellRelayControl
Relay control using Raspberry Pi and Bash Shell

Remote control of AC Power to devices using rpi and a relay module.  This repository will is for the shell script controlling the GPIO pin on the Raspberry Pi.
1st Version HW tested with RPI3B and Digital Data Logger Controllable Four Outlet Power Relay Module version 2 from Adafruit https://www.adafruit.com/product/2935
RPI3B header Pin 23/GPIO 11 as control output and RPI3B header pin 25 as ground.

![2935-13](https://user-images.githubusercontent.com/33469212/211696481-763d18a4-e3b9-4fc4-baa8-c7ceca66ad1e.jpg)



newacpower.sh
relay control gpio:

gpio 11 pin 23

gpio 9 pin 21

gpio 10 pin 19

gpio 22 pin 15

Works with module with 4 relays
"DZS Elec 5V 4 Channel Relay Optocoupler Isolation Module Red Board 3-5V High and 0-1.5V Low Level Triggered Load AC 0-250V / DC 0-30V 10A SCM IO Control"
at
https://smile.amazon.com/dp/B07BDJJTLZ?ref=ppx_yo2ov_dt_b_product_details&th=1


![71x5CobURnL _AC_SX679_](https://user-images.githubusercontent.com/33469212/211696390-93347097-db83-4c5c-9f50-29bd0908837c.jpg)
