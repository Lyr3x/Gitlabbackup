#!/bin/bash
pushd `dirname $0` > /dev/null
HOME=`pwd -P`
popd > /dev/null

cd $HOME
source ./conf/config.cfg
### For omnibus package ###
#Make a new backup
omnibus_package(){
gitlab-rake gitlab:backup:create
#Delete backups which are older than 30 days
find $BACKUP_DIRECTORY/*.tar -mtime +30 -exec rm {} \;
#Sync with your S3 Server
#You need to setup s3cmd with s3cmd --configure first
s3cmd sync --skip-existing --delete-removed $BACKUP_DIRECTORY s3://$AWS_DIRECTORY
}

### For Source install ### 
#Make a new backup
source_install(){
cd /home/git/gitlab
sudo -u git -H bundle exec rake gitlab:backup:create RAILS_ENV=production
Delete backups which are older than 30 days
find /home/git/gitlab/tmp/backups/*.tar -mtime +30 -exec rm {} \;
Sync with your S3 Server
You need to setup s3cmd with s3cmd --configure first
s3cmd sync --skip-existing --delete-removed /home/git/gitlab/tmp/backups/ s3://[your_bucket]/gitlab/backups/
}

#Get Home of the script
if [ $INSTALL == "omnibus" ]
	then omnibus_package
elif [ $INSTALL == "source" ]
	then source_install
fi
