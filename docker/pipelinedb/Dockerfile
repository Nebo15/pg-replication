FROM pipelinedb/pipelinedb
LABEL maintainer "andrii.krymets@finstar.com"

#--- Download pglogical
RUN echo "deb [arch=amd64] http://packages.2ndquadrant.com/pglogical/apt/ jessie-2ndquadrant main" > /etc/apt/sources.list.d/2ndquadrant.list && \
    wget --quiet -O - http://packages.2ndquadrant.com/pglogical/apt/AA7A6805.asc | sudo apt-key add - && \
    apt-get update && \
    apt-get download libpq5 postgresql-9.5-pglogical && \
    dpkg -i --ignore-depends=postgresql-9.5 libpq5_9.4.10-0+deb8u1_amd64.deb && \
    dpkg -i --ignore-depends=postgresql-9.5 postgresql-9.5-pglogical_1.2.2-1jessie_amd64.deb && \
    sed 's/, postgresql-9.5//g' /var/lib/dpkg/status > /var/lib/dpkg/status-new && \
    mv /var/lib/dpkg/status /var/lib/dpkg/status.bkp && \
    mv /var/lib/dpkg/status-new /var/lib/dpkg/status

RUN mv /usr/lib/postgresql/9.5/lib/* /usr/lib/pipelinedb/lib/pipelinedb/ && \
    mv /usr/lib/postgresql/9.5/bin/* /usr/lib/pipelinedb/bin/ && \
    mv /usr/share/postgresql/9.5/extension/* /usr/lib/pipelinedb/share/pipelinedb/extension/

RUN apt-get install -y vim mc

COPY pipelinedb.conf /scripts/conf/
#COPY pg_hba.conf /scripts/conf/
COPY configure_pg_hba.sh /
RUN /configure_pg_hba.sh

ENV TERM=xterm \
    PGDATA=/mnt/pipelinedb/data \
    MASTER_HOST=172.17.0.2 \
    REPLICA_HOST=172.17.0.3
