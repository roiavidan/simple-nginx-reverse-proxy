#!/bin/sh -eu

cat <<EOF > /etc/nginx/conf.d/default.conf
log_format jsonlog escape=json '{"progname":"$APP_NAME","severity":"INFO","time":"\$time_iso8601","request":"\$request","status":"\$status","transactionId":"\$http_x_transaction_id"'
                               ',"userAgent":"\$http_user_agent","ip":"\$remote_addr","principalId":"\$http_x_principalid"}';

server {
  listen 80;
  server_name proxy;
  access_log /dev/stdout jsonlog;

  location ~ ([^/]+)(/.*)?\$ {
    proxy_pass       http://$BACKEND_HOST\$2\$is_args\$args;
    proxy_set_header Host \$1.$HOST_SUFFIX;
    proxy_set_header X-Real-IP \$remote_addr;
    proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    proxy_set_header X-Original-URI \$request_uri;
  }
}
EOF

exec nginx -g "daemon off;"
