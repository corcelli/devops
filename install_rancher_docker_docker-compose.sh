#!/bin/bash
apt-get remove docker docker-engine docker.io containerd runc -y
apt-get install apt-transport-https ca-certificates curl  gnupg lsb-release -y
curl https://releases.rancher.com/install-docker/19.03.sh | sh
curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker run -d -p 9000:9000 -p 8000:8000 --restart=always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce --admin-password='$2y$05$bzntTUAjYqWrB9I6XXWDM.tRUMH8LM5Sk3xy0Ye/94Y4gh2toBCYC'
