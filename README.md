## Overview

It is a simple app to create alerts and list them.

### Pre-requisite

Make sure to download/clone the public reposity from git for this application:

`git clone https://github.com/lloyd01sanchez12/alert.git`

Please take note from where you perform download the code as this can affect proceeding steps.

###Okteto Environment

Make sure that okteto CLI is already enabled, initialized or installed into your shell:

`curl https://get.okteto.com -sSfL | sh`

Then, you can now login to okteto via CLI using an OKTETO_TOKEN:

`okteto login --token ${OKTETO_TOKEN}`

This is optional, but you may also first create a backup of your existing `config` file under directory `~/.kube/`

Afterwards, you may now update the KUBECONFIG in order to point or set your kubectl environment into your okteto's user cluster or namespace:

`okteto context update-kubeconfig`


#####Okteto Registry Log-in 

Before you start the deployment, make sure that you are successfully logged in to okteto and its docker registry by using the command below:

`docker login registry.cloud.okteto.net`


### Deployment

Before you begin, make sure that the namespace should also be updated accordingly from the helm chart's `values.yaml` file. To update, use the command:

`sed -i 's/<input your namespace here>/okt_namespace/g' $PWD/alert_helm/values.yaml`

The application will automatically be deployed using ansible-playbook:

`ansible-playbook alert-app-pipeline.yaml --extra-vars "appnamespace={input your namespace}"`
