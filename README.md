# RPIShellRelayControl
Relay control using Raspberry Pi and Bash Shell

Remote control of AC Power to devices using rpi and a single relay module.  This repo has bash shell scripts used to control relays via GPIO's pins on the 40 pin header of a Raspberry PI 3B or 4B.


singlerelay.sh 

tested with RPI3B and RPI4B and Digital Data Logger Controllable Four Outlet Power Relay Module version 2 from Adafruit https://www.adafruit.com/product/2935
RPI3B header Pin 23/GPIO 11 as control output and RPI3B header pin 25 as ground.

Note that this relay module powers it's own relay and only needs signal pins from the RPI

![2935-13](https://user-images.githubusercontent.com/33469212/211696481-763d18a4-e3b9-4fc4-baa8-c7ceca66ad1e.jpg)



---------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------

quadrelay.sh and testquadrelay.sh 

tested with RPI3B and a four relay module "DZS Elec 5V 4 Channel Relay Optocoupler Isolation Module Red Board 3-5V High and 0-1.5V Low Level Triggered Load AC 0-250V / DC 0-30V 10A SCM IO Control"
at
https://smile.amazon.com/dp/B07BDJJTLZ?ref=ppx_yo2ov_dt_b_product_details&th=1

relay control gpio:

RPI gpio 11 pin 23 to Relay Module IN1

RPI gpio 9 pin 21 to Relay Module IN2

RPI gpio 10 pin 19 to Relay Module IN3

RPI gpio 22 pin 15 to Relay Module IN4

RPI GND on Pin 6 to Relay Module DC-

Note that the RPI cannot provide sufficient current on it's own to power more than one relay activated at a time.  For my testing I provided separate power to the relay from a second USB charging port.  USB 5V to Relay Module DC+ and USB GND to Relay Module DC-



![71x5CobURnL _AC_SX679_](https://user-images.githubusercontent.com/33469212/211696390-93347097-db83-4c5c-9f50-29bd0908837c.jpg)


To Do:
1. Generate Schematic

Stretch Goals:
1. Create complete RPI control solution in a box/1U rack shelf
2. AC Plugs with individual power control via RPI and Relay Board
3. Network connectivity via RPI Ethernet/Wifi
4. USB/Serial port connections to monitor device console ports during power on
5. USB/Etehrnet ports for additional ethernet conenctivity for remote port mirroring/capture or routing
6. Additional USB hub to expand USB port connections
7. Power supply tha can power the RPI, Relays and USB Hub
8. Safe Power down switch for RPI
9. Cable Management


Extra Strech Goal
1. Remote KVM for computers connected to the Relays
