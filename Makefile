init:docker minikube

docker:
  sudo amazon-linux-extras install -y docker
  sudo systemctl enable docker
  sudo systemctl start docker
  sudo usermod -aG docker $(whoami)

minikube:
  curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
  minikube config set driver docker
  alias kubectl="minikube kubectl --"
