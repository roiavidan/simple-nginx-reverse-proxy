# Simple NGINX reverse proxy

This repo provides an extremely basic NGINX reverse proxy image.

It requires a single environment variable - `BACKEND_HOST` which defines where requests are sent to over **HTTP**.

Notes:

- Proxy is done from port 80 to port 80;

- Original `Host` header is passed to the target.
