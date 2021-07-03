## Схема проекта
![alt text](https://raw.githubusercontent.com/levensta/minikube-services/master/cluster-schema.jpg)

## Основные команды
- `minikube start --vm-driver=virtualbox` запуск миникуба с подключенным драйвером virtualbox. Изменение драйвера изменяет диапазон ip с которыми может работать MetalLB. Флаг `--disk-size=NUM` позволит выделить место на NUM Мбайт (по умолчанию место выделяется на 20 Гб.
Перед запуском желательно убедиться, что миникуб уже не запущен и прописать команды: `minikube stop` и `minikube delete`

- `eval $(minikube docker-env)`

- `minikube addons enable metallb` включает MetalLB из списка расширений, но может достичь ограничения загрузки образов с докерхаба.

- `kubectl apply -f configmap.yaml` применяет конфиг .yaml

- Посмотреть состояние сущностей:
	* `kubectl get pods`
	* `kubectl get deploy`
	* `kubectl get svc`

- Удалить сущности:
	* `kubectl delete pods name`
	* `kubectl delete deploy name`

- Для поиска ошибок:
	* `kubectl logs name`
	* `kubectl describe pods name`
