# k8s-formation
## Alcance
- Ayudar a entender las interioridades de kubernetes, bajando a entender conceptos de docker y subiendo hasta el uso y entendimiento de la herramienta kops


## Preparación del entorno de trabajo
1. Instalación de docker
2. Instalación de Kubectl y Minikube

## Índice

1. [Docker](https://github.com/mikim83/k8s-formation/tree/master/1.docker#1docker)
	- [Conceptos básicos](https://github.com/mikim83/k8s-formation/tree/master/1.docker#1docker)
	- [Arrancar tu primer contenedor](https://github.com/mikim83/k8s-formation/tree/master/1.docker#12-arrancar-tu-primer-contenedor)
	- [Crea tu primer contenedor](https://github.com/mikim83/k8s-formation/tree/master/1.docker#13-crea-tu-primer-contenedor)
	- [Opciones mas usadas](https://github.com/mikim83/k8s-formation/tree/master/1.docker#14-opciones-mas-usadas-de-docker)
	- [Red en docker](https://github.com/mikim83/k8s-formation/tree/master/1.docker#15-red-en-docker)
	- [Enlazar contenedores](https://github.com/mikim83/k8s-formation/tree/master/1.docker#16-enlazar-contenedores)
	- [Arrancar un contenedor con volumen persistente](https://github.com/mikim83/k8s-formation/tree/master/1.docker#17-arrancar-un-contenedor-con-volumen-persistente)
	- [Wordpress + mysql](https://github.com/mikim83/k8s-formation/tree/master/1.docker#18-wordpress--mysql)
	- [Docker-compose](https://github.com/mikim83/k8s-formation/tree/master/1.docker#19-docker-compose)
2. Kubernetes
	- Conceptos básicos
	- Objetos 
		- Pod
		- Deployment
		- ReplicaSet
		- Service
		- DaemonSet
		- ConfigMap
		- Secrets
		- Ingress
		- PersistentVolumes
	- Iniciación a Minikube y kubectl
	- Arranca tu primera aplicación
	- Crea tu primera aplicación
	- Da acceso externo a tu aplicacón
		- Service
		- Ingress
	- Asigna un volúmen persistente a tu aplicación
	- Componentes infraestructura
		- Nodos Master
		  - Kubelet
		  - Api Server
		  - Scheduler
		  - etcd
		  - Controller
		- Nodos Worker
		  - Proxy
3. Kops
	- Conceptos básicos
	- Componentes de un cluster
	- Ejemplo de creación de un cluster
	- Modificación de componentes 
4. Mirando al futuro
	- EKS
	- RBAC 


## Referencias Externas
 - [Docker](https://www.docker.com/)
 - [Docker Hub](https://hub.docker.com/)
 - [Minikube](https://github.com/kubernetes/minikube)
 - [Kubernetes](https://kubernetes.io/)
 - [Kops - Kubernetes Operations](https://github.com/kubernetes/kops)
 - [A few things I've learned about Kubernetes](https://jvns.ca/blog/2017/06/04/learning-about-kubernetes/)

