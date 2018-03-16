
# Namespace
kubectl create namespace efk

# Elasticsearch
kubectl create -f elasticsearch/service-account.yml
kubectl create -f elasticsearch/es-discovery-service.yml
kubectl create -f elasticsearch/es-master-rc.yml
kubectl create -f elasticsearch/rbac.yml
kubectl create -f elasticsearch/es-client-rc.yml
kubectl create -f elasticsearch/es-data-rc.yml
kubectl create -f elasticsearch/es-service.yml

# Fluentd
kubectl create -f fluentd/rbac.yml
kubectl create -f fluentd/fluentd.yml

# Kibana
kubectl create -f kibana/kibana.yml
kubectl create -f kibana/kibana-service.yml
