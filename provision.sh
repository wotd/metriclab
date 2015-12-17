#!/bin/bash
apt-get update
locale-gen pl_PL pl_PL.UTF-8
dpkg-reconfigure locales
apt-get -y upgrade

wget http://influxdb.s3.amazonaws.com/influxdb_0.9.5.1_amd64.deb -O /tmp/influxdb_0.9.5.1_amd64.deb
dpkg -i /tmp/influxdb_0.9.5.1_amd64.deb
#/etc/init.d/influxdb start
service influxdb start

wget http://get.influxdb.org/telegraf/telegraf_0.2.4_amd64.deb -O /tmp/telegraf_0.2.4_amd64.deb
dpkg -i /tmp/telegraf_0.2.4_amd64.deb
service telegraf start

wget https://grafanarel.s3.amazonaws.com/builds/grafana_2.6.0_amd64.deb -O /tmp/grafana_2.6.0_amd64.deb
dpkg -i /tmp/grafana_2.6.0_amd64.deb
apt-get install -y adduser libfontconfig
service grafana-server start
