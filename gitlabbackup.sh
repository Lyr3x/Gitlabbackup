#!/bin/bash
#### sudoers crontab entry: 1. Create backup 2. remove old backups 3. copy backup to user folder 4. change rights for the user script
# 0 2 * * * sudo gitlab-rake gitlab:backup:create
# 0 3 * * * sudo find /var/opt/gitlab/backups/*.tar -mtime +30 -exec rm {} \;
# 0 4 * * * sudo cp /var/opt/gitlab/backups/* /home/lyrex/gitlab/backups/
# 0 5 * * * sudo chown -R lyrex:lyrex /home/lyrex/gitlab/
BACKUPDIRECTORY='/home/lyrex/gitlab/backups/'
### For omnibus package ###
#Make a new backup

#Sync with an Github/Gitlab Repository
cd $BACKUPDIRECTORY
git add *
TIME=$(date +"%d-%m-%Y")
git commit --all -m "$TIME"
git push
