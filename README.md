# ecotopia-today-mapseed

mapseed prototype

https://github.com/mapseed/api

### quick start:

create an `.env` file, like:

```sh
POSTGRES_PASSWORD=someRANDOMpassword
POSTGRES_USER=mapseeduser
POSTGRES_DB=shareabouts_v2
PASS=someRANDOMpassword
USERNAME=mapseeduser
HOST=pg
PORT=5432
SOCIAL_AUTH_TWITTER_KEY=
SOCIAL_AUTH_TWITTER_SECRET=
SOCIAL_AUTH_FACEBOOK_KEY=
SOCIAL_AUTH_FACEBOOK_SECRET=
SOCIAL_AUTH_GOOGLE_OAUTH2_KEY=
SOCIAL_AUTH_GOOGLE_OAUTH2_SECRET=
```

then run:

```sh
docker pull 3dwardsharp/ecotopia-today-mapseed
docker-compose up
docker exec -it ecotopia-today-mapseed_api_1 /bin/bash
src/manage.py migrate
src/manage.py createsuperuser
```

visit http://localhost:8010/admin


### misc 

#### make docker start on system start 

```sh
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

#### nginx.template: 

note the `comand` for the web (3dwardsharp/nginx-certbot) instance in `docker-compose.yml`: `command: /bin/bash -c "envsubst '$${BASE_SERVER},$${ADMIN_SERVER}' < /etc/nginx/conf.d/nginx.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"` you need to explicitly tell `envsubst` about the variables to substitute like `'$${BASE_SERVER},$${ADMIN_SERVER}'` note the `$$`. otherwise envsubst will replace other `$` variables in nginx.template with blank strings.
