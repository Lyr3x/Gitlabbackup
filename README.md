# Gitlabbackup
A small shellscript to backup your Gitlab and push it to your S3 storage
## How To
- Setup your local backup directory
- Create a bucket and a new Key
- install s3cmd: `sudo apt-get install s3cmd`
- Setup s3cmd with `s3cmd --configure`
- Select your config and set the right path to the directories
- run the script
