#!/bin/sh

current_dir=$(pwd)
date=`date +"%Y%m%d-%I%M%S"`
#
# include env
#
source $current_dir/vars

#ansible-playbook --become playbooks/dev/neovim/mydev.yml
#ansible-playbook --become --skip-tags=plugins,shell  playbooks/dev/neovim/mydev.yml
ansible-playbook --become --tags=lua playbooks/dev/neovim/mydev.yml
