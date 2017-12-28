#!/bin/bash
kubectl get pods
kubectl get namespaces
echo "Nothing here."
echo "Lets create a namespace..."
less kubernetes/namespace_production.yml
kubectl create -f kubernetes/namespace_production.yml
kubectl get namespaces
echo "Now, we have a namespace!"
echo "Lets bake some secrets..."
echo -n "runner" > ./kubernetes/secrets/POSTGRES_USER
echo -n "SUP3R_S3CR37-P455W0RD" > ./kubernetes/secrets/POSTGRES_PASSWORD
echo -n "PASTEGITHUBHEY" > ./kubernetes/secrets/GITHUB_KEY
echo -n "PASTEGITHUBSECRET" > ./kubernetes/secrets/GITHUB_SECRET
kubectl create --namespace=production secret generic produciton-secrets --from-file=kubernetes/secrets/
kubectl --namespace=production get secrets
echo "Now we have secrets! And they're not shared across namespaces! Check this out:"
kubectl get secrets
echo "Now, let's create a volume to persist our postgres data on it."
gcloud compute disks create --size 200GB postgres-volume
gcloud compute disks list
echo "Now, let's create out postgres service and deployment"
echo "First, lets check what's on the postgres deployment:"
less kubernetes/deployment_postgres.yml
echo "Looks ok to me, let's deploy it:"
kubectl --namespace=production create -f kubernetes/deployment_postgres.yml
kubectl --namespace=production get pods
echo "... and give it a couple seconds for the postgres container to start properly..."
kubectl --namespace=production describe deployment postgres
echo "erm... not yet..."
kubectl --namespace=production get pods
echo "There you go!"
echo "Let's check the postgres' service manifest:"
less kubernetes/service_postgres.yml
echo "Now, let's expose the postgres INTERNAL service"
kubectl --namespace=production create -f kubernetes/service_postgres.yml
kubectl --namespace=production get services
echo "Alright! Now, lets deploy our app."
echo "Let's get a quick peek under the hood of our app deployment:"
less kubernetes/deployment_rails.yml
kubectl --namespace=production create -f kubernetes/deployment_rails.yml
kubectl --namespace=production get pods
echo "And expose it with an external Cloud Load Balancer"
echo "This service is a different kind of service, let's see what's different from the postgres one:"
less kubernetes/service_rails.yml
kubectl --namespace=production create -f kubernetes/service_rails.yml
kubectl --namespace=production get services
echo "Let's give a minute for Google to provision our Load Balancer..."
kubectl --namespace=production get services | grep produciton | awk '{print $4}'
echo "Alright, lets curl it!"
curl -I $(kubectl --namespace=production get services | grep prod | awk '{print $4}')
echo "Oh, we need to run our migrations, right?"
echo "Jobs, are a different kind of Kuberentes object, those will run once and never again."
echo "Let's see how a job manifest looks like:"
less kubernetes/job_migrations.yml
echo "Now, let's schedule it:"
kubectl --namespace=production create -f kubernetes/job_migrations.yml
echo ".... and give it a minute to run"
kubectl describe jobs -n production | grep "Pods Statuses"
echo "Alright, let's try hiting tha Load Balancer again"
curl -I $(kubectl --namespace=production get services | grep prod | awk '{print $4}')
echo "Awesome!"
echo "Lets open it on a browser:"
kubectl --namespace=production get services | grep produciton | awk '{print $4}'
