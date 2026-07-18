#!/usr/bin/env bash
# File location: modules/services/webserver-cluster/user-data.sh
# Purpose: Install and start a small web server on each EC2 instance.
set -euo pipefail

dnf install -y python3
mkdir -p /opt/fctc-web
cat > /opt/fctc-web/index.html <<EOF
<!doctype html>
<html><body>
<h1>Hello from ${cluster_name}</h1>
<p>Terraform created this webserver.</p>
<p>Database endpoint: ${db_address}:${db_port}</p>
</body></html>
EOF

cat > /etc/systemd/system/fctc-web.service <<EOF
[Unit]
Description=From Cover to Code webserver
After=network-online.target
[Service]
Type=simple
WorkingDirectory=/opt/fctc-web
ExecStart=/usr/bin/python3 -m http.server ${server_port}
Restart=always
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now fctc-web.service
