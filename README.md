# Automated infrastructure deployment and configuration

The project represents an infrastructure-as-code. It deploys 3 VMs using vagrant:

## 1. controller 

It's the infrastructure management machine. Contains ssh keys for the other two VMs and uses Ansible Playbooks to setup itself and the other machines at deployment time.

## 2. jenkins 
Runs instances of Jenkins and Nexus. Its task is to look for changes in the repository of a [Hello World app built using Maven](https://github.com/vlad77ivan/HelloWorld-Maven), test new versions, build an updated Docker image and push it to Docker Hub and then deploy it on the specific machine.

A Job DSL script inside a XML is present in the code. It will be run automatically at setup to create the required job.

The source code also contains templates for creating users in both Jenkins and Nexus, roles in Nexus, as well as templates for adding credentials in Jenkins.

## 3. production

It's the machine used to deploy the app. Runs a Docker container with the last successful build.

## Usage:

You need to add credentials for GitHub and Docker Hub, populate user and role templates for for Nexus, users for Jenkins, add your desired jdk. Files need to be specfied in the main.yml of the vars directory for the related role.

To start the deployment run the script run.sh from /vragrant.
