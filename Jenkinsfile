pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-pass') // Jenkins credentials ID
        IMAGE_NAME = "<your-dockerhub-username>/flask-docker-jenkins"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/<your-username>/docker-jenkins-ci-cd.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:latest .'
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh 'docker run $IMAGE_NAME:latest pytest test_app.py'
            }
        }

        stage('Push Image to Docker Hub') {
            steps {
                sh '''
                    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
                    docker tag $IMAGE_NAME:latest $IMAGE_NAME:${BUILD_NUMBER}
                    docker push $IMAGE_NAME:latest
                    docker push $IMAGE_NAME:${BUILD_NUMBER}
                '''
            }
        }
    }

    post {
        success {
            echo "✅ Build and push successful!"
        }
        failure {
            echo "❌ Build failed."
        }
    }
}

