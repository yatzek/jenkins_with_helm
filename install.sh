#!/usr/bin/env bash

helm install --name jenkins -f jenkins-values.yaml stable/jenkins

#NOTES:
#1. Get your 'admin' user password by running:
#  printf $(kubectl get secret --namespace default jenkins-jenkins -o jsonpath="{.data.jenkins-admin-password}" | base64 --decode);echo
#2. Get the Jenkins URL to visit by running these commands in the same shell:
#  NOTE: It may take a few minutes for the LoadBalancer IP to be available.
#        You can watch the status of by running 'kubectl get svc --namespace default -w jenkins-jenkins'
#  export SERVICE_IP=$(kubectl get svc --namespace default jenkins-jenkins --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
#  echo http://$SERVICE_IP:8080/login
#
#3. Login with the password from step 1 and the username: admin
#
#For more information on running Jenkins on Kubernetes, visit:
#https://cloud.google.com/solutions/jenkins-on-container-engine

# to open jenkins page
minikube service jenkins-jenkins

# to delete
helm del --purge jenkins