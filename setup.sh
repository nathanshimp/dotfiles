#!/bin/sh

cwd=$(pwd)

cd $(dirname $0) # Change to 'dotfiles' directory

# Look at me being all functional
for config in $(ls | grep -v $(basename $0)); do
    ln -sf $(pwd)/$config $HOME/.$config
done

cd $cwd
