
# kubernetes-efk

This repository contains the config to manually deploy an EFK stack(v6.2.2) on to an existing Kubernetes cluster. 

EFK can also be enabled on Kubernetes cluster creation with the below environment variables, but this repo is for deploying EFK on to an existing Kubernetes cluster. More info on enabling EFK on K8S install is here: https://kubernetes.io/docs/tasks/debug-application-cluster/logging-elasticsearch-kibana/

```
KUBE_LOGGING_DESTINATION=elasticsearch
KUBE_ENABLE_NODE_LOGGING=true
```

In the current state, Fluentd is deployed as a DaemonSet, and will send all logs in `/var/log/containers/*` to ElasticSearch. 

Elasticsearch is deployed as 3 separate Deployments(1 replica each):

 1. Master 
 2. Client
 3. Data

## Installation

1. Update the Fluentd config at `fluentd/conf/containers.conf` if you want to change which containers to collect logs for. Not doing anything here will collect logs for `all` containers running in Kubernetes.  

2. Build/push the Fluentd image to a docker registry.

```
docker build -t <YOUR_FLUENTD_IMAGE> .
docker push <YOUR_FLUENTD_IMAGE>
```

3. Update the Fluentd image path in `fluentd/fluentd.yml`

4. Login to your Kubernetes Master node, clone this repo, and run `./deploy.sh` to deploy the EFK stack. 

5. Run `kubectl proxy` if not already running, and port forward `5061` to localhost.

6. Access the Kibana dashboard at http://localhost:8001/api/v1/namespaces/efk/services/kibana-logging/proxy
