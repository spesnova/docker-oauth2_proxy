# docker-oauth2_proxy
A docker image for [bitly's OAuth2 Proxy](https://github.com/bitly/oauth2_proxy).

Please read official [README](https://github.com/bitly/oauth2_proxy) about OAuth2 Proxy itself.

## Supported Tags

- `2.2`, `latest` ([`Dockerfile`](https://github.com/spesnova/docker-oauth2_proxy/blob/master/Dockerfile))

## How to use the image
### Quickstart with Docker Compose
First, configure OAuth2 Proxy using `.env`.

```
$ cp .env.sample .env
```

```
OAUTH2_PROXY_HTTP_ADDRESS=0.0.0.0:4180
OAUTH2_PROXY_EMAIL_DOMAIN=*
#OAUTH2_PROXY_UPSTREAM=http://upstream
OAUTH2_PROXY_CLIENT_ID=
OAUTH2_PROXY_CLIENT_SECRET=
OAUTH2_PROXY_COOKIE_SECRET=
OAUTH2_PROXY_COOKIE_SECURE=false
OAUTH2_PROXY_PROVIDER=
```

You can generate a strong cookie secret by this command:

```
$ python -c 'import os,base64; print base64.b64encode(os.urandom(16))'
```

Then simply run:

```
$ docker-compose up
```

A nginx container will also be up for example upstrem.
You can hit http://127.0.0.1:4180 or http://host-ip:4180 in your browser.

## Configuration
### OAuth Provider Configuration

- `OAUTH2_PROXY_CLIENT_ID` (required)
- `OAUTH2_PROXY_CLIENT_SECRET` (required)
- `OAUTH2_PROXY_PROVIDER`
- `OAUTH2_PROXY_LOGIN_URL`
- `OAUTH2_PROXY_REDEEM_URL`
- `OAUTH2_PROXY_PROFILE_URL`
- `OAUTH2_PROXY_RESOURCE`
- `OAUTH2_PROXY_VALIDATE_URL`
- `OAUTH2_PROXY_SCOPE`
- `OAUTH2_PROXY_APPROVAL_PROMPT`

### Basic Auth

- `OAUTH2_PROXY_PASS_BASIC_AUTH`
- `OAUTH2_PROXY_PASS_USER_HEADERS`
- `OAUTH2_PROXY_PASS_HOST_HEADERS`
- `OAUTH2_PROXY_HTPASSWD_FILE`
- `OAUTH2_PROXY_DISPLAY_HTPASSWD_FORM`

### Google Auth Options

- `OAUTH2_PROXY_GOOGLE_GROUP`
- `OAUTH2_PROXY_GOOGLE_ADMIN_EMAIL`
- `OAUTH2_PROXY_GOOGLE_SERVICE_ACCOUNT_JSON`

### Azure Auth Options

- `OAUTH2_PROXY_AZURE_TENANT`

### GitHub Auth Options

- `OAUTH2_PROXY_GITHUB_ORG`
- `OAUTH2_PROXY_GITHUB_TEAM`

### Email Authentication

- `OAUTH2_PROXY_EMAIL_DOMAIN` (required)
- `OAUTH2_PROXY_AUTHENTICATED_EMAILS_FILE`

### Cookie

- `OAUTH2_PROXY_COOKIE_NAME`
- `OAUTH2_PROXY_COOKIE_SECRET`
- `OAUTH2_PROXY_COOKIE_DOMAIN`
- `OAUTH2_PROXY_COOKIE_EXPIRE`
- `OAUTH2_PROXY_COOKIE_REFRESH`
- `OAUTH2_PROXY_COOKIE_HTTPONLY`

### Upstream settings

- `OAUTH2_PROXY_REDIRECT_URL`
- `OAUTH2_PROXY_UPSTREAM` (required)
- `OAUTH2_PROXY_PASS_ACCESS_TOKEN`

### SSL

- `OAUTH2_PROXY_TLS_CERT_FILE`
- `OAUTH2_PROXY_TLS_KEY_FILE`
- `OAUTH2_PROXY_COOKIE_SECURE`
- `OAUTH2_PROXY_SSL_INSECURE_SKIP_VERIFY`
- `OAUTH2_PROXY_HTTP_ADDRESS`
- `OAUTH2_PROXY_HTTPS_ADDRESS`

### Endpoint

- `OAUTH2_PROXY_PROXY_PREFIX`

### Request signatures

- `OAUTH2_PROXY_SIGNATURE_KEY`

### Logging

- `OAUTH2_PROXY_REQUEST_LOGGING`

### Custom HTML Template

- `OAUTH2_PROXY_CUSTOM_TEMPLATES_DIR`
- `OAUTH2_PROXY_FOOTER`
