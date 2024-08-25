# minikube-aws

This is the project for Minikube execution environment.

The maintaner uses EC2 instance(Amazon Linux2) as the virtual machine.

Minikube need 2CPUs, so the instance type is larger than t2.medium.

## Setup
SSH to EC2 Instance and follow these steps in it.

### Git
```
$ sudo yum update
$ sudo yum install -y git
$ mkdir ~/workspace
$ cd workspace
$ git clone https://github.com/takahiroaoki/minikube-aws.git
```

### Docker & Minikube
```
$ cd ~/workspace/minikube-env
$ make init
```

## How to use
### Nginx sample (WIP)
Get index page through `localhost:8000 -> ssh tunnel -> ec2:80 -> each pod`

```
$ minikube start

# Apply
$ kubectl apply -f nginx/nginx.yml -f nginx/debug.yml
$ kubectl port-forward service/nginx-svc 8000:80
```
The port is OK only if its larger than 1023 and available on your host machine.


### Kubernetes dashboard
```
# On one terminal
$ minikube dashboard

# On another terminal
$ kubectl proxy --address=0.0.0.0 --accept-hosts='.*' --port=8080
```
Then, you can access to `http://${EC2 instance public IP}:8080/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/`

## Appendix
### minikube
```
# Start node
$ minikube start

# Stop node
$ minikube stop

# Check status
$ minikube status

# Delete node
$ minikube delete

# Check addons
$ minikube addons list
```

### kubectl
```
# Apply manifest file
$ kubectl apply -f ${file name}

# Delete resource
$ kubectl delete -f ${file name}

# Check pod status
$ kubectl get pod [-o wide]

# Connect to pod
$ kubectl exec -it ${pod name} -- sh

# Copy file to pod
$ kubectl cp ${src path} ${pod name}:${dest path}

# Copy file from pod
$ kubectl cp ${pod name}:${src path} ${dest path}

# Check pod info
$ kubectl describe pod/${pod name}

# Check log in a pod
$ kubectl logs pod/${pod name}
```
