
#!/bin/sh -e

cd /var/lib/smartmontools/drivedb

mv drivedb.h drivedb.bak

wget https://raw.githubusercontent.com/mirror/smartmontools/master/drivedb.h

exit 0
