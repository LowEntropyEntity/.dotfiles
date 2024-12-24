all: prepare
	ansible-playbook playbook.yml

prepare:
	curl https://raw.githubusercontent.com/LowEntropyEntity/.dotfiles/main/.setup/arch/playbook.yml > playbook.yml
	mkdir -p /etc/ansible
	sh -c 'echo "localhost ansible_connection=local" > /etc/ansible/hosts'
	mkdir -p /var/log
	touch /var/log/ansible.log
	echo '[defaults]' > /etc/ansible/ansible.cfg
	echo 'log_path = /var/log/ansible.log' >> /etc/ansible/ansible.cfg
