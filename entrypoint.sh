#!/bin/sh -eu

cat <<EOF > /etc/nginx/conf.d/default.conf
server {
  listen 80;
  server_name proxy;

  location / {
    proxy_pass              http://$BACKEND_HOST;
    proxy_set_header        Host \$host;
    proxy_set_header        X-Real-IP \$remote_addr;
    proxy_set_header        X-Forwarded-For \$proxy_add_x_forwarded_for;
  }
}
EOF

exec nginx -g "daemon off;"
