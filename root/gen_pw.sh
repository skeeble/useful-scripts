#!/bin/sh
tr -dc A-Za-z0-9 < /dev/urandom | head -c {$1:-4} | xargs
