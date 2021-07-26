
# Instructions:

1. Clone the repository.

2.  Cd to '/root/game-of-pods-Kodekloud/Voting App'

3. Create the namespace 'vote' with below command :

`kubectl create ns vote`

4. Create all required service and deployments using below command :

`kubectl create -f .`

5. Check the running pods in vote namespace by :
  
`kubectl get pod -n vote`