pipeline {
  agent none
  stages {
    stage('Clean') {
      steps {
        sh 'mvn clean'
      }
    }
    stage('Build') {
      steps {
        sh 'mvn build'
      }
    }
    stage('Test') {
      steps {
        echo 'Test Now'
      }
    }
  }
}