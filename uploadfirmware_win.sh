#!/bin/bash

# to run from the command line:   ./loadfirmware_win.sh firmware_filename

# default firmware_filename is mighty_one_v6.0.0.hex
# default port is usb
# you can change 'usb' to '/dev/ttyACM0' in linux

#cd $( dirname $( readlink -f "${BASH_SOURCE[0]}" ))

if test -z "$1"
then
  FILENAME=mighty_one_v6.0.0.hex
else
  FILENAME=$1
fi

while true; do

FAILUSB="Fimware Program PASS"
  
   echo "Press Enter to upload 1280 firmware"
   read 

   # Upload firmware via usb
   #avrdude -F -p m1280 -P $PORT -c stk500v1 -b 57600 -U flash:w:$FILENAME
   avrdude -F -V -p m1280 -P usb -c avrispmkii -b 57600 -U flash:w:$FILENAME

   if [ $? -ne 0 ]
    then
       FAILUSB="Fimware Program FAIL"
    fi

	echo $FAILFIRMWARE
done

#!/bin/bash



