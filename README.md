
# kubernetes-efk

This repository contains the necessary configs to manually deploy a trial version of an EFK stack(v6.2.2) on Kubernetes. In the current state, Fluentd is deployed as a DaemonSet and will send all logs in `/var/log/containers` to ElasticSearch. 

1. Update the Fluentd config at `fluentd/conf/containers.conf` if you want to change which containers to collect logs for. Not doing anything here will collect logs for `all` containers running in k8s.  

2. Build/push the Fluentd image to a docker registry.

```
docker build -t <YOUR_FLUENTD_IMAGE> .
docker push <YOUR_FLUENTD_IMAGE>
```

3. Update the Fluentd image path in `fluentd/fluentd.yml`

4. Login to your Kubernetes Master node, and run `./deploy.sh` to deploy the EFK stack. 

5. Run `kubectl proxy` if not already running, and port forward `5061` to localhost.

6. Access the Kibana dashboard at http://localhost:8001/api/v1/namespaces/efk/services/kibana-logging/proxy
