#!/bin/bash
sudo sed -i 's/#   StrictHostKeyChecking ask/StrictHostKeyChecking no/g'  /etc/ssh/ssh_config
sudo systemctl restart ssh
sudo systemctl restart sshd
sudo cat /vagrant/id_rsa.pub |  cat >> /home/vagrant/.ssh/authorized_keys

