#!/bin/bash

# finds last created file in each subdirectory of backup tree, 
# only directories in form of backup*
# reports datetime and name of the file

# root directory of backups
BACKUP_DIR=/backup

cd $BACKUP_DIR

for dir in backup*/; do
    find $dir -type f -printf '%C@\t%C+\t%p\n'|sort -nrk1|cut -f2-|head -1
done

