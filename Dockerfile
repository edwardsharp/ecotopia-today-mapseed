# Dockerfile to build Python WSGI Application Containers
# Based on Debian
# & Luke Swart <luke@smartercleanup.org>

FROM buildpack-deps:jessie

MAINTAINER 3dwardsharp

RUN apt-get update

RUN apt-get install -y tar git curl wget dialog net-tools build-essential gettext python-dev python-distribute python-pip python-psycopg2 libpq-dev postgis

RUN git clone https://github.com/mapseed/api.git && cd api && git checkout 0.6.8 && cd -

RUN pip install -r /api/requirements.txt

EXPOSE 8010

WORKDIR /api

RUN mkdir static
VOLUME /api/static

CMD /api/start.sh

# CMD sh -c "python src/manage.py collectstatic --noinput && gunicorn wsgi:application -w 3 -b 0.0.0.0:8010"
