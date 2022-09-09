#!/bin/bash
if [ ! -f /etc/haproxy/haproxy.cfg ]; then
  C=XX
  ST=XX
  L=XXXXXXXXX
  O=XXXXX
  OU=XX
  HOST=localhost.com
  DATE=$(date '+%Y%m%d')
  CN=$HOST

  # Install haproxy
  apt -y install haproxy

  # Generate a unique private key (KEY)
  sudo openssl genrsa -out "${HOST}.key" 2048

  # Generating a Certificate Signing Request (CSR)
  sudo openssl req -new -key "${HOST}.key" -out "${HOST}.csr" <<EOF
${C}
${ST}
${L}
${O}
${OU}
${CN}
selfsigned@${CN}
.
.
EOF

  # Creating a Self-Signed Certificate (CRT)
  openssl x509 -req -days 365 -in "${HOST}.csr" -signkey "${HOST}.key" -out "${HOST}.crt"

  # Append KEY and CRT to localhost.com.pem
  sudo bash -c "cat ${HOST}.key ${HOST}.crt >> /etc/ssl/private/${HOST}.pem"

  # Specify PEM in haproxy config
  sudo vim /etc/haproxy/haproxy.cfg
  listen haproxy
    bind 0.0.0.0:443 ssl crt /etc/ssl/private/mydomain.pem

  # Configure haproxy
  cp /home/vagrant/files/haproxy /etc/default/haproxy
  cp /home/vagrant/files/haproxy.cfg /etc/haproxy/haproxy.cfg
  cp /home/vagrant/files/rsyslog-haproxy.conf /etc/rsyslog.d/49-haproxy.conf
  cp /home/vagrant/files/logrotate /etc/logrotate.d/haproxy

  # systemctl restart haproxy
fi