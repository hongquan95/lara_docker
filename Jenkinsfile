pipeline {
    agent none
    environment {
        DOCKER_IMAGE = "hongquan95/lara_docker"

    }

    stages {
        // stage("build") {
        //     environment {
        //         DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
        //     }
        //     steps {
        //         sh "echo ${DOCKER_TAG}"
        //         sh "docker build -t ${DOCKER_IMAGE}:v-${DOCKER_TAG} . "
        //         sh "docker push ${DOCKER_IMAGE}:v-${DOCKER_TAG}"
        //         sh "docker image ls | grep ${DOCKER_IMAGE}"
        //         script {
        //             if (GIT_BRANCH ==~ /.*master.*/) {
        //                 sh "docker tag ${DOCKER_IMAGE}:v-${DOCKER_TAG} ${DOCKER_IMAGE}:latest"
        //                 sh "docker push ${DOCKER_IMAGE}:latest"
        //             }
        //         }
        //     }
        // }

        stage("Test") {
            agent { node {label 'master'}}
            environment {
                DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${GIT_COMMIT.substring(0,7)}"
            }
            steps {
                // sh "docker run -it --rm ${DOCKER_IMAGE}:v-${DOCKER_TAG} php artisan test"
                sh "git ls-remote https://github.com/hongquan95/lara_docker"
                sh "echo ${GIT_BRANCH}-${DOCKER_TAG}"
            }
        }
        stage("Deploy") {
            agent { node {label 'master'}}
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
