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

## Ошибки
Если external ip в бесконечном ожидании (pending), значит ограничен лимит скачиваний с докерхаба и MetalLB не может запуститься, для решения нужно скачать образы самостоятельно:

- `eval $(minikube docker-env)`
- `docker pull metallb/speaker:v0.8.2`
- `docker pull metallb/controller:v0.8.2`

Как понять что это та проблема?
вбиваем в консоль `kubectl get pods -n metallb-system`  — вылезут 2 строчки. У них есть статус READY. Если в нем видим 0/1 - это наш случай. 
Дальше копируем название любого пода и пишем `kubectl describe pod <pod> -n metallb-system`  — получаем гору текста. Второй строкой видим **Pulling Image <name>**, третьей — **Failed to pull image**. Всё просто - он пытается анонимно скачать его, а мы уже поняли что докер такого не дает. Копируем имя имеджа, качаем ему этот имедж сами - Profit. То же самое можно сделать и с другим подом.

--

Если прописывать IP явно, то в yaml файле (конфиг service) должен быть соответствующий параметр

```
metadata:
  annotations:
    metallb.universe.tf/allow-shared-ip: minikube
...
type: LoadBalancer
loadBalancerIP: явный ip
```
--
Если, при перезапуске influxd, не сохраняются метрики:

1. Качаем более старую версию influxdb: `apk add influxdb --repository=http://dl-cdn.alpinelinux.org/alpine/v3.10/community/`
2. В качестве тома указываем `/root/.influxdb`

--
В Grafana в data sources имя БД указываем telegraf, иначе может показывать ошибку.

--
Иногда переменная `$host` может отвалиться в reverse proxy, поэтому в nginx конфиге лучше указывать ip явным образом
