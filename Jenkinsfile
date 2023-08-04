pipeline{
  agent any
  environment{
  DOCKERHUB_CREDENTIALS = credentials('docker-hub-sankar')
  }
  stages{
    stage('SCM checkout'){
      steps{
        git 'https://github.com/sankar0812/hello-world.git'
      }
    }
    stage('Build docker image'){
      steps{
        sh 'docker build -t sankar0812/httpd:$BUILD_NUMBER .'
      }
    }
    stage('login to dockerhub'){
      steps{
        sh 'echo DOCKERHUB_CREDENTIALS_PSW | docker login -u DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('push the image'){
      steps{
        sh 'docker push sankar0812/httpd:$BUILD_NUMBER'
      }
    }
    stage('run the container'){
      steps{
        sh 'docker run -d --name httpd-web -p 80:80 sankar0812/httpd:$BUILD_NUMBER'
      }
    }
  }
  post{
    always{
       sh 'docker logout'
    }
  }
}
