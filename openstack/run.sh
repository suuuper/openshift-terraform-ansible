#!/bin/bash
# ./run.sh --private-key=~/.ssh/redhat_rsa
dynamic(){
terraform apply

sleep 15

terraform refresh

sleep 120
}

ansible-playbook -i ../terraform.py ./ansible/rhel-sub.yml $@
ansible-playbook -i ../terraform.py ./ansible/ose3-prep-nodes.yml $@
ansible-playbook -i ../terraform.py ./ansible/ose3-install.yml $@


#ssh cloud-user@156.54.176.94  sudo -H ansible-playbook -i enterprise-inventory  /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml

#ansible-playbook -i ../terraform.py ./ansible/ose3-postinstall.yml $@
