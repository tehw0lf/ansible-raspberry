# provision raspberry pi 3 with SSH, docker and unattended upgrades

create vars file
`echo "micro_sd_device: /dev/sdb" > vars.yml`
`echo "main_user: dockerpi" >> vars.yml`
`echo "pass: random_password" >> vars.yml`
`echo "local_user: tehwolf" >> vars.yml`
`echo "raspberry_ip: ip_address" >> vars.yml`

run first ansible playbook
`ansible-playbook prepare-image.yml -K`

The playbook will write the raspberry pi image to `micro_sd_device` and generate an ssh key for use once the second playbook has completed

boot up the raspberry pi to get its ip address

create hosts file
`echo "[raspberry_pi]" > hosts`
`echo "dockerpi ansible_ssh_host=ip_address ansible_user=dockerpi ansible_password=random_password" >> hosts`
`echo 'ansible_ssh_common_args="-o UserKnownHostsFile=/dev/null"' >> hosts`

run second ansible playbook
`ansible-playbook --inventory-file=hosts provision-raspberry.yml`
