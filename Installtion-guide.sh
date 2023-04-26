#kubernetes customer mastar and workernodes installtion using kubeadm

#steps

#1: Clone git repo

git clone https://github.com/NAGA222/K8S_Master-Worker_installtion_using_KudeAdm.git


#2: Run common.sh in all master and worker nodes

cd Custom_K-Master_-_Worker_Nodes_installtion_using_Kubeadm
chmod 700 /scripts/common.sh
./scripts/common.sh


#3: Run master.sh in master node
#note: make the PUBLIC_IP_ACCESS="true" in master.sh 
chmod 700 /scripts/master.sh
./scripts/master.sh


#4: copy and save in the notes --- kubeadm join and token cmd


#5: verify the kubeclt master configuration

kubectl get po -n kube-system


#6: Verify all the cluster component health statuses

kubectl get --raw='/readyz?verbose'


#7: Cluster Info

kubectl cluster-info 


#Optional: If you dont want worker nodes and schedule apps in master node use the following cmd

kubectl taint nodes --all node-role.kubernetes.io/control-plane-


#8: If didn't stored the token cmd get the token 

kubeadm token create --print-join-command


#9: Copy and Paste the kube-join-token output in the worker nodes


#10: Verify nodes are connected to master or not. In master node by following cmd

kubectl get nodes


#11: Setup and install Kubernetes Metrics Server --By default it kubeadm will not install

#verify metric server installed or not
kubectl top nodes

#Install using following cmd
kubectl apply -f https://github.com/NAGA222/Custom_K-Master_-_Worker_Nodes_installtion_using_Kubeadm/blob/master/manifests/metrics-server.yaml

#verify the kubernetes metrics 
kubectl top nodes

#Verify the pod CPU and memory metrics
kubectl top pod -n kube-system

#12: Verify the workernodes working or not by deploying sample ngnix deployment
kubectl apply -f https://github.com/NAGA222/Custom_K-Master_-_Worker_Nodes_installtion_using_Kubeadm/blob/master/manifests/sample-app.yaml
#verify the output 
#public ip of worker node:32000

