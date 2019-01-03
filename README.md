# Simple NGINX reverse proxy

This repo provides an extremely basic NGINX reverse proxy image with JSON access logs.

It requires a the following environment variables:

- `APIS_BACKEND_HOST`
- `BFFS_BACKEND_HOST`

**NOTES**:

- All requests are sent to over **HTTP**.

- Listening on port 80;

- The `X-Real-IP` and `X-Forwarded-For` headers are passed along to the target.
