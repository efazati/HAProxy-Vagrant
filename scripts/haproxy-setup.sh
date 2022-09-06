#!/bin/bash

if [ ! -f /etc/haproxy/haproxy.cfg ]; then
  # Install haproxy
  apt -y install haproxy

  # Configure haproxy
  cp /home/vagrant/files/haproxy /etc/default/haproxy
  cp /home/vagrant/files/haproxy.cfg /etc/haproxy/haproxy.cfg
  cp /home/vagrant/files/haproxy-setup.sh /etc/rsyslog.d/49-haproxy.conf

  systemctl restart haproxy
fi