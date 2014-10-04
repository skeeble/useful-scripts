#!/bin/sh

#define vars
MYDIR=`pwd`
DATE=`date +"%Y-%m-%d-%H%M"`
DESTFOLDER={"$1":"~/wordpress/"}
TEMPFOLDER="/tmp/$DATE-wordpress-temp"

#move to temp folder
cd /tmp

#get wordpress
wget http://wordpress.org/latest.zip
unzip -o -u latest.zip -d "$TEMPFOLDER"

#relocate files
mv "$TEMPFOLDER/wordpress/*" "$DESTFOLDER"

#clean up
rm -r {"$TEMPFOLDER","/tmp/latest.zip"}

#restore dir
cd "$MYDIR"
