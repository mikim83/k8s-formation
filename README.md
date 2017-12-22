# k8s-formation
## Alcance
- Ayudar a entender las interioridades de kubernetes, bajando a entender conceptos de docker y subiendo hasta el uso y entendimiento de la herramienta kops


## Preparación del entorno de trabajo
1. Instalación de docker
2. Instalación de Kubectl y Minikube

## Índice

1. Docker
	- Conceptos básicos
	- Arrancar tu primer contenedor
	- Crea tu primer contenedor
	- Enlazar contenedores
	- Arrancar un contenedor con volumen persistente
	- docker-compose
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
