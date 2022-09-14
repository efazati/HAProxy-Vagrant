#!/bin/bash

ssh haproxy -c "sudo tail -f /var/log/haproxy-traffic.log"