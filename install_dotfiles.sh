#! /bin/bash

MYCONF_FILE=".myconf"
BACKUP_FILE=".conf_backup"

git clone --bare https://bitbucket.org/durdn/cfg.git $HOME/$MYCONF_FILE
function config {
   /usr/bin/git --git-dir=$HOME/$MYCONF_FILE/ --work-tree=$HOME $@
}
mkdir -p $HOME/$BACKUP_FILE
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | echo #xargs -I{} mv {} \
        $HOME/$BACKUP_FILE/{}
fi;
config checkout
config config status.showUntrackedFiles no


