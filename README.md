# Docker - Influxdb - Graphite

## Build image

```shell
make build

docker build -t sjeandeaux/docker-influxdb-graphite 
```

TIP: with [proxy](https://gist.github.com/sjeandeaux/b752e3d593ad6cdb2485) 
 (docker build -t sjeandeaux/docker-influxdb-graphite -f docker-proxy-file )

## Run influxdb

### Basically

This command starts influxdb with default configuration


```shell
make run

docker run -d --name runInfluxdb -p 8083:8083 -p 8086:8086 -p 2003:2003  \
           -v $(pwd)/data:/opt/influxdb/shared/data \
           sjeandeaux/docker-influxdb-graphite
```


