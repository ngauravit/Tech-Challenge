# Challenge1

In this challenge we will be deploying a 3-tier web application named "guestbook". This application takes user input as key and outputs the same on the interface.It uses Kubernetes service type LoadBalancer to expose the application onto an external IP address.

This web application has below 3 tiers:
1. Frontend Web 
2. Redis Master for storing the key input from user.
3. Redis Slave as replica to master.

First we will have to create a Linux VM where we will be installing docker and kubectl.

We will use Terraform to create an Azure Kubuernetes Service cluster (K8sDemoCluster). To do that we will perform below steps:


**Cluster Creation**
```console
cd AKS
terraform init
terraform plan 
terraform apply
```

After the Cluster is created on Azure we will connect with the cluster using below command.

**Connect to Cluster**
```console
az aks get-credentials --resource-group K8sDemoRG --name K8sDemoCluster
```


Once the connection to the cluster is established, we will deploy our application using below commands.

**Deploy Application**
```console
cd App_Deploy
kubectl apply -f guestbook-deployment.yaml     ~~~> Creates the guestbook pods.
kubectl apply -f guestbook-service.yaml        ~~~> Creates the guestbook service.
kubectl apply -f redis-master-deployment.yaml  ~~~> Provision the Redis Master Pod.
kubectl apply -f redis-master-service.yaml     ~~~> Provision the Redis Master service.
kubectl apply -f redis-slave-deployment.yaml   ~~~> Provision the Redis Slave Pods.
kubectl apply -f redis-slave-service.yaml      ~~~> Provision the Redis Master service.
```


After the above deployments of resources are done we will take the loadbalancer's IP an will try to access it from the browser. In the browser open http://20.166.202.230:3000/ and give user input key for the application to store.

After that we will try to see the connection between the Master and Slave pod. We will run below commands on our Linux machine:
```console
kubectl get pods
kubectl exec -it "podname" redis-cli
```

Once we are inside the pod, we can run below commands to check the communication between the master and slave service.
```console
keys *
lrange guestbook 0 10

```

