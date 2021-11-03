#! /bin/bash

MYCONF_FILE=".myconf"
BACKUP_FILE=".conf_backup"

git clone --bare https://github.com/seamyb88/myconf $HOME/$MYCONF_FILE
function config {
   /usr/bin/git --git-dir=$HOME/$MYCONF_FILE/ --work-tree=$HOME $@
}
mkdir -p $HOME/$BACKUP_FILE
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Removing pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} rm {}
fi;
config checkout
config config status.showUntrackedFiles no


