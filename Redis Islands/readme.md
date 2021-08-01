# Instructions:

1. ssh into node01 and create the redis folders with below command :

`mkdir /redis{01..06}`

2. Go to the redis Islands directory and run the below command to deploy configmap, pv, service and redis statefulset :

`kubectl apply -f . `

3. Verify that all redis pods ar runnign by running command :

`kubectl get pod -l app=redis-cluster`

4. Run the below command to join configure the cluster :

`kubectl exec -it redis-cluster-0 -- redis-cli --cluster create --cluster-replicas 1 $(kubectl get pods -l app=redis-cluster -o jsonpath='{range.items[*]}{.status.podIP}:6379 ')`

Additonal reference : https://rancher.com/blog/2019/deploying-redis-cluster/

