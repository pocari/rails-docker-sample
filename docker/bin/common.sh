SCRIPT_DIR=$(cd $(dirname $0) && pwd)
export APP_ROOT_DIR=$(dirname $(dirname $SCRIPT_DIR))/railsapp/myapp
export DB_DOCKERFILE_DIR=${SCRIPT_DIR}/../containers/db
export WEBAPP_DOCKERFILE_DIR=${SCRIPT_DIR}/../containers/webapp
export DOCKER_COMMAND=docker
