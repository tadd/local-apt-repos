#!/bin/sh
set -eu

cp mydebs.list /etc/apt/sources.list.d/
cp 99mydebs-update /etc/apt/apt.conf.d/
mkdir -p /usr/local/mydebs
cp update-debs /usr/local/mydebs/
