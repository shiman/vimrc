#!/bin/bash

set -e

VIMRC_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
for x in $VIMRC_DIR/.vimrc.*
do
    filename=`basename $x`
    ln -sf $x $HOME/$filename
done
