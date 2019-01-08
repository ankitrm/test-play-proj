# install.sh
#!/bin/sh

# Install kubernetes and set config
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

mkdir ${HOME}/.kube
cp ci/k8/config ${HOME}/.kube/config

# Fill out missing params in kubectl config file
kubectl config set clusters.eks_terraform-eks-cluster.certificate-authority-data "$KUBE_CLUSTER_CERTIFICATE"
kubectl config set clusters.eks_terraform-eks-cluster.server "$KUBE_CLUSTER_SERVER"