pipeline {
    agent any

    stages {
        stage('Git') {
            steps {
                git 'https://github.com/Anudeepkumar02/kia.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Artifact download') {
            steps {
                sh 'aws s3 cp target/*.war s3://warfileswebproject/kia/kia.war'
                sh 'aws s3 cp target/*.war s3://warfileswebproject/kia/kia$BUILD_NUMBER.war'
            }
        }
        stage('Build docker image') {
            steps {
                script{
                    sh 'docker build -t kia:$BUILD_NUMBER . '
                }
            }
        }
        stage('Push docker images to docker hub') {
            steps {
                script{
                    withCredentials([string(credentialsId: 'dhp', variable: 'dhp')]) {
                    sh 'docker login -u 2222s -p ${dhp}'        
     
}
                    sh 'docker tag kia:$BUILD_NUMBER 2222s/kia:$BUILD_NUMBER'
                    sh 'docker push 2222s/kia:$BUILD_NUMBER'
                }

                
            }
        }
    }
}
