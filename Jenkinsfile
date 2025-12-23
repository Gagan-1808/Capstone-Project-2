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
            agent { label 'mytest' }
            steps {
                echo "Fetching latest code from GitHub..."
                checkout scm
            }
        }
    

        stage('Build Docker Image') {
           agent { label 'mytest' }
            steps {
                script {
                    echo "Building Docker image..."
                    sh """
                        sudo docker build -t ${IMAGE_NAME}:${IMAGE_TAG} .
                    """
                }
            }
        }
        

        stage('Run Docker Container') {
           agent { label 'mytest' }
            steps {
                script {
                    echo "Running container for testing..."
                    sh """
                        sudo docker run -d --name myapp-test -p 80:80 ${IMAGE_NAME}:${IMAGE_TAG}
                    """
                }
            }
        }
        

        stage('Test Docker Container') {
            agent { label 'mytest' }
            steps {
                script {
                    echo "Testing container health..."
                    // Example test: check if container is running
                    sh """
                        sleep 10
                        sudo docker ps | grep myapp-test
                    """
                }
            }
        }

        stage('Push to Dockerhub and Logout') {
            agent { label 'mytest' }
            when {
                expression { currentBuild.currentResult == "SUCCESS" }
            }
            steps {
                script {
                    withCredentials([usernamePassword(
                        credentialsId: 'Dhub', 
                        usernameVariable: 'DOCKER_USER', 
                        passwordVariable: 'DOCKER_PASS'
                    )]) {
                         sh """
                            set -e
                            echo "Logging into Docker..."
                            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                            sudo docker push ${IMAGE_NAME}:${IMAGE_TAG}
                            sudo docker logout
                         """
                    }
                }
            }
        }
    }
}
        
