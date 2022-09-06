#!/bin/bash

if [ ! -f /var/www/html/index.html ]; then

  # Install apache
  apt -y install apache2
  cat > /var/www/html/index.html <<EOD
<html><head><title>${HOSTNAME}</title></head><body>
<h1>${HOSTNAME}</h1>
<p>This is the default web page for ${HOSTNAME}.</p>
<img src="/logo.png" />
</body></html>
EOD

  # Log the X-Forwarded-For
  perl -pi -e  's/^LogFormat "\%h (.* combined)$/LogFormat "%h %{X-Forwarded-For}i $1/' /etc/apache2/apache2.conf
  systemctl restart apache2 

fi


