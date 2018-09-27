# Provisioning for ACL Bastion Host
Inside this repository there is a provision.sh file which can be used to configure a VM for usage during the Autonomous Cloud Lab. The accompanying Vagrantfile can be used to automatically provision a VM as well.

# Requirements for using the Vagrant file
Following is required to use this vagrant vm
1. vagrant up by hashicorp (https://www.vagrantup.com/)
2. VirtualBox (https://www.virtualbox.org/wiki/Downloads)

# Requirements for using the provision.sh file
None - just copy the file to a blank Ubuntu VM (tested on Xenial) and make sure it is executable

# What it does
Following software is installed
1. Docker CE
2. gcloud sdk
3. azure cli
4. kubernetes cli
5. openshift cli
6. maven
7. python
8. nodejs
9. awscli

# Usage for the Vagrant file
`vagrant up`

# Usage for when running the provision script 
Note that this step is not required when using the Vagrant approach, as this will automatically execute it.
`./provision.sh`