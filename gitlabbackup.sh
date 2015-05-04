#!/bin/sh
### For omnibus package ###
#Make a new backup
gitlab-rake gitlab:backup:create
#Delete backups which are older than 30 days
find /home/git/gitlab/tmp/backups/*.tar -mtime +30 -exec rm {} \;
#Sync with your S3 Server
#You need to setup s3cmd with s3cmd --configure first
s3cmd sync --skip-existing --delete-removed /home/git/gitlab/tmp/backups/ s3://[your_bucket]/gitlab/backups/


### For Source install ### 
#Make a new backup
# cd /home/git/gitlab
# sudo -u git -H bundle exec rake gitlab:backup:create RAILS_ENV=production
#Delete backups which are older than 30 days
# find /home/git/gitlab/tmp/backups/*.tar -mtime +30 -exec rm {} \;
#Sync with your S3 Server
#You need to setup s3cmd with s3cmd --configure first
# s3cmd sync --skip-existing --delete-removed /home/git/gitlab/tmp/backups/ s3://[your_bucket]/gitlab/backups/