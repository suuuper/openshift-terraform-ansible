#!/bin/bash
# ./run.sh --private-key=~/.ssh/redhat_rsa
terraform apply

sleep 15

terraform refresh

sleep 120


ansible-playbook -i ../terraform.py ./ansible/rhel-sub.yml $@
ansible-playbook -i ../terraform.py ./ansible/ose3-prep-nodes.yml $@
ansible-playbook -i ../terraform.py ./ansible/ose3-install.yml $@

# ssh master-node sudo -H ansible-playbook -i enterprise-inventory  /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml
