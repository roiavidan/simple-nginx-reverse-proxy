#!/bin/sh -eu

cat <<EOF > /etc/nginx/conf.d/default.conf
log_format jsonlog escape=json '{"progname":"nginx","severity":"INFO","time":"\$time_iso8601","request":"\$request","status":"\$status","transactionId":"\$http_x_transaction_id"'
                               ',"userAgent":"\$http_user_agent","ip":"\$remote_addr","principalId":"\$http_x_principalid"}';

server {
  listen 80;
  server_name proxy;
  access_log /dev/stdout jsonlog;

  location /api {
    rewrite          /api(.*) /\$1 break;
    proxy_pass       http://$APIS_BACKEND_HOST;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
  }

  location /bff {
    rewrite          /bff(.*) /\$1 break;
    proxy_pass       http://$BFFS_BACKEND_HOST;
    proxy_set_header Host \$host;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
  }
}
EOF

exec nginx -g "daemon off;"
