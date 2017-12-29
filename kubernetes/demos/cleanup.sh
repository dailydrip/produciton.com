#!/bin/bash
set -x
kubectl -n production delete -f kubernetes/job_migrations.yml

kubectl -n production delete -f kubernetes/service_rails.yml
kubectl -n production delete -f kubernetes/service_postgres.yml

kubectl -n production delete -f kubernetes/deployment_rails.yml
kubectl -n production delete -f kubernetes/deployment_postgres.yml

kubectl -n production delete secret produciton-secrets
kubectl -n production get pods
kubectl delete namespace production

gcloud compute disks delete postgres-volume
