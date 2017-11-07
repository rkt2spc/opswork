#!/bin/sh

kubectl proxy
curl http://localhost:8001/api/v1/proxy/namespaces/default/pods/$POD_NAME/
