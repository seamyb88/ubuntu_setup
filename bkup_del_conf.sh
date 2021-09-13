#! /bin/bash

mkdir -p .conf_backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .conf_backup/{}


