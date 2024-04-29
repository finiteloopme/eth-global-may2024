include config.properties
INFRA_FOLDER=./infra
APP_FOLDER=./app

.dummy: auth, infra-init, infra-plan, infra-deploy, infra-undeploy

auth:
	gcloud auth application-default login

infra-init: #auth
	cd ${INFRA_FOLDER}; make init

infra-plan:
	cd ${INFRA_FOLDER}; make plan

infra-deploy:
	cd ${INFRA_FOLDER}; make deploy

infra-undeploy:
	cd ${INFRA_FOLDER}; make undeploy

app-init:
	cd ${APP_FOLDER}; make init

app-deploy:
	cd ${APP_FOLDER}; make deploy

app-undeploy:
	cd ${APP_FOLDER}; make undeploy