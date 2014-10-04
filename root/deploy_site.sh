#!/bin/sh

# get system
SYSTEM=$1

# get name or dir
NAME=$2
NAMECLEAN=`basename "$NAME"`

#Stack dependent vars... (nginx since 2014-09-01)
VHOSTS="/usr/share/nginx/vhosts"
CONFIGFOLDER="/etc/nginx"

# get install type
TYPE={$3:"static"}

# get install url
TYPE={$4:"none"}

# get install port
TYPE={$5:"80"}

# if name is not dir
if [ ! -d "$NAME" ]; then
	NAME="$VHOSTS/$NAME"
	mkdir -p "$NAME/"{public,private,backup,log}
fi;

#set permissions on folder
chown -R www-data $NAME
chmod -R 775 $NAME

# define config_file as $CONFIGFOLDER/sites-available/$name
CONFIG_FILE="$CONFIGFOLDER/sites-available/$NAMECLEAN"
# backup present working directory
MYDIR=`pwd`
# make the config based upon install type (updated to CURL for post DATA)
curl -o "$CONFIG_FILE" --data-urlencode "type=$TYPE&port=$PORT&url=$URL&name=$NAMECLEAN" http://www.lewiscowles.co.uk/recipies/$SYSTEM
#wget -O $CONFIG_FILE "http://www.lewiscowles.co.uk/recipies/nginx/$TYPE/$PORT/$URL/$NAMECLEAN"
# chmod +x $config_file
chmod +x $CONFIG_FILE
# ln -s $config_file $CONFIGFOLDER/sites-enabled/$name
ln -s $CONFIG_FILE $CONFIGFOLDER/sites-enabled/$NAMECLEAN

# restart (sub-)system
service $SYSTEM restart

