help:
	@echo "       /    \	"
	@echo "      ## a  a       _ 	"
	@echo "      (    ._)     |_| 	"
	@echo "       |'-- |      | | 	"
	@echo "     _.\___/_   ___|_|___	"
	@echo "   .	\> \Y/|<'.  '._.-'	"
	@echo "  /  \ \_\/ /  '-' /	"
	@echo "  | --'\_/|/ |   _/	"
	@echo "  |___ -  |  |''	"
	@echo "    |     |  |	"
	@echo "    |    / ''/	"
	@echo "   /__./  | |	"
	@echo "      \   | |	"
	@echo "       \  | |	"
	@echo "       ;  | |	"
	@echo "       /  | |	"
	@echo " 	  |___\_.\_	"
	@echo "       '-'--'---'  	"

build-mysql-local:
	@kubectl apply -f mysql/deployment.yaml
	@kubectl apply -f mysql/mysql-pv.yaml
	@kubectl apply -f mysql/mysql-pvc.yaml
	@kubectl apply -f mysql/mysql-service.yaml
	@kubectl apply -f mysql/mysql-secret.yaml

build-event-service:
	@echo "Building jeeves microservices, please be sure you are logged in to docker as we will push the image to the hub and minikube is running"
	@docker build -t event-service ./event-service/ -f ../event-service/docker/Dockerfile
	@docker tag event-service ngc23/event-service:latest
	@docker push ngc23/event-service:latest
	@echo "Building of the jeeves services and please be sure you are logged in to docker as we will push the image to the hub, frontend application must still happen with a ionic serve"
	@echo "Docker images done building and pushed..."
	@echo "Applying all the kubernetes files for minikube locally, this will take some time.."
	@kubectl apply -f ../event-service/build/deployments.yaml
	@kubectl apply -f ../event-service/build/service.yaml
	@echo "Completed.... please check deployments with kubectl get deployments if you are not sure the files have applied"

start-app:
	@echo "Starting jeeves.. please make sure build has been ran and pods are running in background, you can do this by using `kubectl get pods`"
	@echo "       /    \	"
	@echo "      ## a  a       _ 	"
	@echo "      (    ._)     |_| 	"
	@echo "       |'-- |      | | 	"
	@echo "     _.\___/_   ___|_|___	"
	@echo "   .	\> \Y/|<'.  '._.-'	"
	@echo "  /  \ \_\/ /  '-' /	"
	@echo "  | --'\_/|/ |   _/	"
	@echo "  |___ -  |  |''	"
	@echo "    |     |  |	"
	@echo "    |    / ''/	"
	@echo "   /__./  | |	"
	@echo "      \   | |	"
	@echo "       \  | |	"
	@echo "       ;  | |	"
	@echo "       /  | |	"
	@echo " 	  |___\_.\_	"
	@echo "       '-'--'---'  	"
	@echo "working with ingress lets check this out"
