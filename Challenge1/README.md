# Challenge1

Cluster Creation
cd AKS
terraform init
terraform plan/apply


Connect to Cluster
az aks get-credentials --resource-group K8sDemoRG --name K8sDemoCluster

Deploy Application

cd App_Deploy
kubectl apply -f *

In the browser open http://20.166.202.230:3000/ and give user input for the application to store.

kubectl get pods
kubectl exec -it "podname" redis-cli


keys *
lrange guestbook 0 10