pipeline {
    agent none

    triggers {
        githubPush()
    }

    environment {
        IMAGE_NAME = "raichu08/myapp"
        IMAGE_TAG = "v${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout Code') {
            agent {
                label 'test1'
            }
            steps {
                echo "Fetching latest code from GitHub..."
                checkout scm
            }
        }

        stage('Build Docker Image') {
           agent {
                    label 'test1'
                 }
            steps {
                script {
                    echo "Building Docker image..."
                    sh """
                        docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    """
                }
            }
        }

        stage('Run Docker Container') {
           agent {
                    label 'test1'
                 }
            steps {
                script {
                    echo "Running container for testing..."
                    sh """
                        docker run -d --name myapp-test -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }

        stage('Test Docker Container') {
            agent {
                    label 'test1'
                 }
            steps {
                script {
                    echo "Testing container health..."
                    // Example test: check if container is running
                    sh """
                        sleep 10
                        docker ps | grep myapp-test
                    """
                }
            }
        }
}
