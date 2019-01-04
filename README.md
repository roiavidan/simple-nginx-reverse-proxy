# Simple NGINX reverse proxy

This repo provides an extremely basic NGINX reverse proxy image with JSON access logs.

It requires a the following environment variables:

- `BACKEND_HOST`
- `APP_NAME`

**NOTES**:

- All requests are sent to over **HTTP**.

- Listening on port 80;

- The `X-Real-IP` and `X-Forwarded-For` headers are automatically added to the request.
