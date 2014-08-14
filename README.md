domoticz_telegram
=================

Telegram installation for Domoticz Home Automation System

This readme file should help you getting started with the Telegram scripts

Installation:
=================
Step 1 - login via Putty: 
Login to raspberry pi as user pi (using standard ssh session with for example the tool 'Putty').
Command: ssh pi@IPADRESS

Step 2 - installation of the files:

cd into your domoticz/scripts directory

Copy TelegramInstall.sh to your rasberry in the /home/pi directory
execute chmod u+x TelegramInstall.sh
execute TelegramInstall.sh

When telegram session is running:
press TAB key and enter your phone number (using your mobile will cause not receiving notifications on new messages, try using your landline): +31612345678

Then enter the code you received by SMS or opt for the 'call' option to get a code

Make sure you get a contact list by adding contacts  (not 100% sure wether this adding contacts is actually needed... please provide me with feedback)
add_contact +31612345678 FirstName LastName
show your current contact list (possible receivers of messages)
contact_list

Send your first message
msg Firstname_Surname notification to send
safe_quit

Prepare scripting for Telegram
------------------------------
location /etc and make sure file rights ok (sudo chmod 754 rc.local)
rc.local - system standard file, extended to start the Telegram service at startup of the Raspberry PI
When you did not update your /etc/rc.local you can overwrite it with the supplied version

copy scripts.tar to /home/pi/telegram/scripts directory
tar xvf scripts.tar 
and make sure file rights are ok (sudo chmod 754 /home/pi/telegram/scripts/custom/*)


Explenation of generic scripts (no need to change these files):
 location /home/pi/telegram/scripts/generic and make sure file rights are ok (sudo chmod 754 /home/pi/telegram/scripts/generic/*)
 -StartTelegramAsService.sh - script used inside of rc.local , no need to change
 -RestartTelegramAsService.sh - can be used to manually restart Telegram service, should never be needed :) , no need to change
 -receive.lua - configuration on what to do with received message, no need to change
 -telegram.sh - shell script to send either messages, pictures, files (all commands for telegram.sh are in https://github.com/vysheng/tg/blob/master/README.md#supported-commands )
     this is the script to use from Domoticz directly to send messages

Explanation of user scripts:
location /home/pi/telegram/scripts/user , these scripts will be executed like 'scriptname Firstname_Lastname'
-temperature.sh - needs user specilisation user specified as parameter
-systemstatus.sh - needs user specilisation user specified as parameter
-smiliesoverview.sh - sends some smilies to user specified as parameter
all user scripts need lowercase names and need to be .sh scripts

