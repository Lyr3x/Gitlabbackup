#!/bin/bash
BACKUPDIRECTORY='/home/lyrex/gitlab/backups/'
### For omnibus package ###
#Make a new backup

#Sync with an Github/Gitlab Repository
cd $BACKUPDIRECTORY
git add *
TIME=$(date +"%d-%m-%Y")
git commit all -m "$TIME"
git push
