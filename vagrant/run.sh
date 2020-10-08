#!/bin/bash

vagrant up
sleep 180

vagrant ssh controller -- -t 'cd /vagrant/ansible; ansible-playbook main.yml'

vagrant reload
sleep 180

vagrant ssh controller -- -t 'cd /vagrant/ansible; ansible-playbook main_post_reboot.yml'
