MongoDB Primary Host
v0.1: 01/11/2017
Elevati Infotech Pvt Ltd


Purpose:
We had to connect php webapp to MongoDB's primary host, the idea of high availability wont be fulfilled if we are hardcoding the IP/Hostname of the primary MongoDB server. When current host either break down or step down as secondary for some reason, the app will be down as it can not read/write data to the broken or secondary server. 

The best solution would be app dynamically connects to the primary host, mongo-primary.sh scriptlet helps the hostname given in the app configuration (default: pri.mongo.db) to resolve with the MongoDB Primary Host.

Note: 
MongoDB driver might have a way to handle this, but without doing any code modification this is the easiest way to serve the purpose.

How it works:
mongo-primary.sh connects to MongoDB on 127.0.0.1 and check the active Primary host. change IP to your MongoDB IP in mongo-primary.sh file. By making an entry to /etc/hosts it will resolve the primary mongodb hosts IP the hostname pri.mongo.db, which you have to use in your web app. To monitor active primary db and change the resolver automatically setup the crons as below:

these 3 cron entires will take care of host entry change in /etc/hosts every 15s. the backup copy would be saved as /etc/hosts.bkp

#MongoDB Primary Host
* * * * * root sleep 15; /usr/bin/mongo-primary.sh
* * * * * root sleep 30; /usr/bin/mongo-primary.sh
* * * * * root sleep 45; /usr/bin/mongo-primary.sh

Parameter to configure:
Copy mongo-primary.sh in /usr/bin and make it executable (chmod 755 /usr/bin/mongo-primary.sh)
Hostname to configure in your script: pri.mongo.db

For any queries or contribution contact neeraj@elevatitech.com
