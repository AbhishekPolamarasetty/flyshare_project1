pipeline {
    agent any

    stages {
        stage('checkout') {
            steps {
               checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/AbhishekPolamarasetty/flyshare_project1.git']])
            }
        }
        stage('Build'){
            steps{
                sh 'docker build -t abhishekpola/flyshare .'
            }
        }
  
        stage('push'){
            steps{
                withCredentials([usernamePassword(credentialsId: 'd0f79194-d3e8-4767-aee4-9d1d8288ab80', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                   sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                   sh 'docker push abhishekpola/flyshare'
                }
            }
        }
        stage('deploy') {
            steps {
                sh 'docker stop demo-container'
                sh 'docker rm demo-container'
                sh 'docker run -d -p 5000:5000 --name demo-container abhishekpola/flyshare'
            }
        }
    }
}
