#!/bin/bash
 kubectl create namespace web1
 kubectl create deployment web-test -n web --image tardocker/web-test:latest
 kubectl scale deployment web-test -n web --replicas 3
 kubectl expose deployment web-test -n web --type=LoadBalancer --port 8000  --external-ip=92.53.116.187
