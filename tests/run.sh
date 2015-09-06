#!/bin/bash

PWD=$(pwd)
ROLE_NAME=franklinkim.mysql

echo 'creating role symlink'
ln -s $PWD /usr/share/ansible/roles/$ROLE_NAME

echo 'running playbook'
ansible-playbook -vvvv -i 'localhost,' -c local $PWD/tests/playbook.yml
