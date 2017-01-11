#!/usr/bin/bash
SED=/usr/bin/sed
MONGO=/usr/bin/mongo
HOSTFILE=/etc/hosts
IP=127.0.0.1  #IP of the mongodb host
PORT=27017      # Mongodb port
$SED -i.bkp '/mongorotate/d' $HOSTFILE 
echo `$MONGO $IP:$PORT --eval  "db.isMaster()"|grep primary|cut -d'"' -f4|cut -d':' -f1` pri.mongo.db \# mongorotate >> $HOSTFILE
