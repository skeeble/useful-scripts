#!/bin/sh
PW=`gen_pw.sh 16`
echo "CREATE DATABASE $1_db IF NOT EXISTS;" >> "$1.sql"
echo "CREATE USER '$1user'@'%' IDENTIFIED BY '$PW';" >> "$1.sql"
echo "GRANT ALL PRIVILEGES ON $1_db.* TO '$1user'@'%';" >> "$1.sql"
echo "FLUSH PRIVILEGES;" >> "$1.sql"
echo `cat "$1.sql"`
