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
