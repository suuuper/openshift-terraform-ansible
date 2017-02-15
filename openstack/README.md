# OpenShift

## Create a pki to be copied on hosts

ssh-keygen -trsa -b2048 -i ansible/id_rsa



## Change registry ip

After changing registry ip (eg dropping dc/docker-registry ...)
you need to restart atomic-openshift-master-{api,controller}

to clean cache from old ip

