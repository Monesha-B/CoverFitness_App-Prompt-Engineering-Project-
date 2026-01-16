pipeline {
    agent any

    environment {
        IMAGE_NAME = "moneshab/fitness-planner"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/Monesha-B/CoverFitness_App-Prompt-Engineering-Project-.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:jenkins .'
            }
        }

        stage('Run Container (Smoke Test)') {
            steps {
                sh '''
                docker run -d -p 8501:8501 --name fitness_test $IMAGE_NAME:jenkins
                sleep 10
                docker ps | grep fitness_test
                '''
            }
        }

        stage('Cleanup') {
            steps {
                sh '''
                docker stop fitness_test || true
                docker rm fitness_test || true
                '''
            }
        }
    }

    post {
        success {
            echo '✅ Jenkins pipeline completed successfully'
        }
        failure {
            echo '❌ Jenkins pipeline failed'
        }
    }
}
