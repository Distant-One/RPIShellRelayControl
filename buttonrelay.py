# Requirements (covers multiple versions of Python):
# Started but heavily modified from 
#	https://www.domoticz.com/forum/viewtopic.php?t=24991
#	Script to detect if circuit is open or closed on Raspberry Pi, Magnetic Reed Switch
#	Post by  ben53252642 » Sunday 23 September 2018 11:21

import RPi.GPIO as GPIO
import time
from time import sleep
import subprocess
from subprocess import Popen

# Raspberry GPIO Configuration
buttongpiopin1 = 8
relaygpiopin1= 22
buttongpiopin2 = 25
relaygpiopin2= 10
buttongpiopin3 = 24
relaygpiopin3= 9
buttongpiopin4 = 23
relaygpiopin4= 11

GPIO.setmode(GPIO.BCM)
buttons = [buttongpiopin1,buttongpiopin2,buttongpiopin3,buttongpiopin4]
relays = [relaygpiopin1,relaygpiopin2,relaygpiopin3,relaygpiopin4]
relaynums = [ "1 ","2 ","3 ","4 "]
for (buttongpiopin, relaygpiopin) in zip(buttons, relays):
    GPIO.setup(buttongpiopin, GPIO.IN, pull_up_down=GPIO.PUD_UP)
    GPIO.setup(relaygpiopin, GPIO.OUT,)
    print("Buttongpiopin = " + str(buttongpiopin) + ", Relaygpiopin = " + str(relaygpiopin))
    


while True:
    for (buttongpiopin, relaygpiopin, relaynum) in zip(buttons, relays, relaynums):
        buttonstate = GPIO.input(buttongpiopin)
        relaystate = GPIO.input(relaygpiopin)
        if buttonstate == True:
             print ('Button 1 not pressed.')
    
        if relaystate == False:
             print ('Relay 1 Off.')
    
        if buttonstate == False:
             print ('Button 1 PRESSED.')
    #        toggle relay
             if relaystate == True:
                  print ('....Turn Relay 1 Off.')
                  subprocess.Popen(['bash','./quadrelay.sh', relaynum,"OFF"])
                  sleep(4)
             else:
                  print ('....Turn Relay 1 ON.')
                  subprocess.Popen(['bash','./quadrelay.sh', relaynum,"ON"])
                  sleep(4)
        
             if relaystate == True:
                  print ('Relay 1 ON.')

    sleep(1)

GPIO.cleanup(gpiopin)
