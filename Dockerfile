FROM sjeandeaux/docker-influxdb:latest

MAINTAINER Stéphane Jeandeaux <stephane.jeandeaux@gmail.com>

#copy sh to run influxdb and configuration by default.
COPY influxdb.toml influxdb.sh /influxdb/
RUN chmod +x /influxdb/influxdb.sh
