pipeline {
    agent any

    environment {
        DOCKER_HUB_USER = 'kiruba007' // change this
        DEV_IMAGE = "${DOCKER_HUB_USER}/react-app-dev"
        PROD_IMAGE = "${DOCKER_HUB_USER}/react-app-prod"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${env.DEV_IMAGE}:latest ."
                }
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    script {
                        sh "echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin"

                        if (env.BRANCH_NAME == 'dev') {
                            sh "docker push ${env.DEV_IMAGE}:latest"
                        } else if (env.BRANCH_NAME == 'master' || env.BRANCH_NAME == 'main') {
                            sh "docker tag ${env.DEV_IMAGE}:latest ${env.PROD_IMAGE}:latest"
                            sh "docker push ${env.PROD_IMAGE}:latest"
                        }
                    }
                }
            }
        }

        stage('Deploy (Optional)') {
            steps {
                echo "🚀 Add deployment steps here if needed"
            }
        }
    }
}

