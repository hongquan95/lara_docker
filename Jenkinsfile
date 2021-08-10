pipeline {
    agent none
    environment {
        DOCKER_IMAGE = "hongquan95/lara_docker"
        DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
    }

    stages {
        stage("build") {
            steps {
                sh "docker build -t ${DOCKER_IMAGE}:v-${DOCKER_TAG} . "
                sh "docker push ${DOCKER_IMAGE}:v-${DOCKER_TAG}"
                sh "docker image ls | grep ${DOCKER_IMAGE}"
                script {
                    if (GIT_BRANCH ==~ /.*master.*/) {
                        sh "docker tag ${DOCKER_IMAGE}:v-${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
                        sh "docker push ${DOCKER_IMAGE}:latest"
                    }
                }
            }
            }

        stage("Test") {
            steps {
                sh "docker run -it --rm ${DOCKER_IMAGE}:v-${DOCKER_TAG} php artisan test"
            }
        }
        stage("Deploy") {
            steps {
                sh "echo Deploy"
            }
        }


    }

    post {
        success {
            echo "SUCCESSFUL"
        }
        failure {
            echo "FAILED"
        }
    }
}
