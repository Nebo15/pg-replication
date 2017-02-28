FROM nebo15/alpine-postgre:9.6
LABEL maintainter <support@nebo15.com>

RUN apk add --update vim less mc

RUN apk update && \
    apk add --no-cache build-base \
        readline-dev \
        openssl-dev \
        zlib-dev \
        libxml2-dev \
        glib-lang \
        wget \
        gnupg \
        ca-certificates && \
    wget http://packages.2ndquadrant.com/pglogical/tarballs/pglogical-1.2.2.tar.bz2 && \
    tar xvjf pglogical-1.2.2.tar.bz2 && \
    cd pglogical-1.2.2 && \
    make USE_PGXS=1 install && \
    apk --purge del build-base zlib-dev libxml2-dev wget gnupg ca-certificates && \
    rm -rf /pglogical-1.2.2*

COPY configure_postgresql.sh /docker-entrypoint-initdb.d/
RUN docker-entrypoint-initdb.d/configure_postgresql.sh

COPY dbinit.sh /

ENV TERM=xterm \
    MASTER_HOST=172.17.0.2/32 \
    REPLICA_HOST=172.17.0.3/32

CMD ["postgres"]
