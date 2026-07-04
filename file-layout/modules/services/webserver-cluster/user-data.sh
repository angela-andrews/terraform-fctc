#!/bin/bash

cat > index.html <<EOF
<h1>Hello, World</h1>
<p style="color: blue;">DB address: ${db_address}</p>
<p style="color: blue;">DB port: ${db_port}</p>
EOF

nohup busybox httpd -f -p ${server_port} &