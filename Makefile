init:docker minikube newgrp

docker:
	sudo amazon-linux-extras install -y docker
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo gpasswd -a ec2-user docker

minikube:
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
	minikube config set driver docker
	echo 'alias kubectl="minikube kubectl --"' >> ~/.bashrc

newgrp:
	newgrp docker