#!/bin/bash
set -m

exec /usr/bin/influxdb -config=$CONFIG &

isReady=666

until [ ! $isReady -ne 0 ]
do
   curl 127.0.0.1:8086/ping --noproxy 127.0.0.1 2> /dev/null
   isReady=$?
done

#create graphite (user and db)
#create dashboard grafana (user and db)
#db graphite
curl -X POST "127.0.0.1:8086/db?u=root&p=root" --data '{"name": "graphite"}' --noproxy 127.0.0.1  -v 
curl -X POST "127.0.0.1:8086/db/graphite/users?u=root&p=root" --data '{"name": "graphite", "password": "graphite"}' --noproxy 127.0.0.1  -v 

#user grafana
curl -X POST "127.0.0.1:8086/db?u=root&p=root" --data '{"name": "grafana"}' --noproxy 127.0.0.1  -v 
curl -X POST "127.0.0.1:8086/db/grafana/users?u=root&p=root" --data '{"name": "grafana", "password": "grafana"}' --noproxy 127.0.0.1  -v 

# add cluster admin
curl -X POST '127.0.0.1:8086/cluster_admins/root?u=root&p=root' -d '{"password": "changeit"}' --noproxy 127.0.0.1  -v 

#up influxdb
fg
