#!/bin/bash

vagrant status
vagrant destroy -f 
vagrant up 
vagrant ssh -c "sudo systemctl restart haproxy"
vagrant status