#!/bin/bash -e

echo '1. First apt update and install packages needed for further work'
sudo apt-get update
sudo apt-get -y install apt-transport-https ca-certificates curl software-properties-common unzip

echo '2. Add Repositories'
#Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

#gcloud
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)"
echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

#kubectl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo touch /etc/apt/sources.list.d/kubernetes.list 
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list

#azure cli
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

#node
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

#python 
sudo add-apt-repository -y ppa:deadsnakes/ppa

sudo apt-get update

###### 3. Install docker and docker-compose, python, nodejs
echo '3. Install packages python, pip, nodejs, google-cloud-sdk, kubectl, azure-cli, maven'
sudo apt-get -y install docker-ce \
    python3.6 \
    python-pip \
    python3-pip \
    nodejs \
    google-cloud-sdk \
    kubectl \
    azure-cli \
    maven

# Changing default python version to 3.6
sudo update-alternatives --install /usr/bin/python python /usr/bin/python2.7 1
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 2

echo '4. Install compose'
sudo pip3 install -q docker-compose

echo '5. Install AWS cli'
pip install awscli --upgrade --user

echo '6. Install OpenShift Origin CLI'
wget -O openshift-cli.tar https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz 
mkdir openshift-cli
tar -xvf openshift-cli.tar -C ~/openshift-cli --strip-components=1
echo 'export PATH="$PATH":~/openshift-cli' >> ~/.profile
cd ~

echo '7. Install Terraform'
wget -O terraform.zip https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip
mkdir terraform
unzip terraform.zip -d ~/terraform
echo 'export PATH="$PATH":~/terraform' >> ~/.profile