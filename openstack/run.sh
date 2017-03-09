#!/bin/bash
# ./run.sh --private-key=~/.ssh/redhat_rsa
dynamic(){
terraform apply

sleep 15

terraform refresh

sleep 120
}

prepare(){
ansible-playbook  ./ansible/rhel-sub.yml $@ &&
ansible-playbook  ./ansible/ose3-prep-nodes.yml $@ &&
ansible-playbook  ./ansible/ose3-install.yml $@ 

echo "Packages installed successfully!"
echo "Now login to the os3-lb node and run the ansible playbook"
echo "ssh cloud-user@156.54.x.x  sudo -H ansible-playbook -i enterprise-inventory  /usr/share/ansible/openshift-ansible/playbooks/byo/config.yml"
echo "After the installation works, run the postinstall"
}


post(){
ansible-playbook -i ../terraform.py ./ansible/ose3-postinstall.yml $@
}

case $1 in
	prepare)
		prepare
		;;
	post)
		post
		;;
	*)
		echo "$0 [prepare|post]"
		exit 1
		;;
esac
