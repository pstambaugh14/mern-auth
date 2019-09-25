#!/usr/bin/groovy
// Declarative Pipeline
def project = 'mern-auth-jenks-k8s'
def appName = 'mern-auth'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def feSvcName = "mern-auth-service"
pipeline {
  agent any
    environment {
      CUR_DIR_VAR = "${WORKSPACE}"
      PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/var/lib/jenkins/npm/bin"
      registry = "pstambaugh14/mern-auth-jenks-k8s2"
      registryCredential = 'dockerhub'
      dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'
          }
    stages {
      stage('Checkout') {
        steps {
        checkout scm }
}
        stage('Initialize') {
          steps {
              echo "${appName} is the var for appName"
              echo "${WORKSPACE} is the var for WORKSPACE"
  }
}
        stage('Build') {
            steps {
              echo 'Building..'
	            sh 'npm init -y'
              sh 'npm install'
              sh 'npm run client-install'
              sh 'npm install nodemon'
              sh 'cd client && npm init -y'
              sh 'cd client && npm install'
              sh 'cd client && npm install nodemon'
              sh 'npm audit fix'
            }
        }
        stage('Building image') {
          steps{
            script {
              dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
          }
        }
        stage('Deploy Image') {
          steps{
             script {
                docker.withRegistry( '', registryCredential ) {
                dockerImage.push()
              }
            }
          }
        }
        stage('Deploy Application') {
          steps {
             sh '"${WORKSPACE}"/pod-check.sh'
             sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
             //Update the imagetag to the latest version
             sh("sed -i.bak 's#${project}/${appName}:${imageVersion}#${imageTag}#' "${WORKSPACE}"/*.yaml")
             //Create or update resources
             sh("kubectl --namespace=${namespace} apply -f "${WORKSPACE}"/k8s/deploy/deployment.yaml")
             //Grab the external Ip address of the service
             sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
      }
  }
        stage('Remove Unused docker image') {
          steps{
            sh "docker rmi $registry:$BUILD_NUMBER"
          }
      }
}
// IF DESIRED: CLEAN WORKSPACE AFTER BUILD ALSO
        post {
          always {
            cleanWs()
    }
  }
}
