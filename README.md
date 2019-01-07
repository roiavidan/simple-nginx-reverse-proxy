# Simple NGINX reverse proxy

This repo provides an extremely basic NGINX reverse proxy image with JSON access logs.
It transforms the request so that the first path part is sent as the host (with the suffix).

For example:

`GET /foo/bar?answer=42` will result in sending the `Host: foo` header and the URI will be `/bar?answer=42`.

It requires a the following environment variables:

- `BACKEND_HOST`
- `APP_NAME`
- `HOST_SUFFIX`

**NOTES**:

- All requests are sent to over **HTTP**.

- Listening on port 80;

- The `X-Real-IP` and `X-Forwarded-For` headers are automatically added to the request;

- The special `X-Original-URI` header is appeneded to the request with the original URI NGINX received.
