#!/bin/bash
##
# Add SFTP and Pure-FTP user
##

USER=$1

# Check for valid argument/username

if [ -z $1 ]
then
echo -e "\nERROR: No username supplied\nUsage: $0 <username>\n"
exit 1
fi

# SFTP

adduser $USER --ingroup sftponly --home /pub/ --shell /usr/bin/rssh --force-badname
if [ `grep $USER /etc/passwd | wc -l` == 1 ]
then
mkdir -p /ftphome/$USER/pub
chown root.root /ftphome/$USER
chown $USER.sftponly /ftphome/$USER/pub
else
echo -e "\nERROR: Can't find username in /etc/passwd - Exiting\n"
exit 1
fi
