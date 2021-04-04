minikube start --vm-driver=virtualbox --disk-size=2048
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb
kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/pvolume.yaml

docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx/nginx.yaml
docker build -t mysql_image ./srcs/mysql
kubectl apply -f ./srcs/mysql/mysql.yaml