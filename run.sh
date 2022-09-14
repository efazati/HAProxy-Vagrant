#!/bin/bash

vagrant status
vagrant destroy -f 
vagrant up 
vagrant ssh haproxy -c "sudo systemctl restart haproxy"
vagrant status
