#!/bin/bash

CONFIG_FILE='/root/.node-red/rancher-consul-flow.json'

sed -i "s/{RANCHER_ACCESS_KEY}/$RANCHER_ACCESS_KEY/g" ${CONFIG_FILE}
sed -i "s/{RANCHER_SECRET_KEY}/$RANCHER_SECRET_KEY/g" ${CONFIG_FILE}
sed -i "s/{RANCHER_HOST}/$RANCHER_HOST/g" ${CONFIG_FILE}
sed -i "s/{CONSUL_URL}/$CONSUL_URL/g" ${CONFIG_FILE}

exec node /opt/node-red-0.12.4/red.js
