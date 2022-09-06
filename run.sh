#!/bin/bash

vagrant up haproxy
vagrant up web1
vagrant up web2

vagrant ssh -c "sudo systemctl restart haproxy"