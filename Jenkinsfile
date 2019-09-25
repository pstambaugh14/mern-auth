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
//  tools {nodejs "Node.js 10.16.3"}
          environment {
//            CUR_DIR_VAR = "${WORKSPACE}"
//            PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/var/lib/jenkins/npm/bin"
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
              echo "${appName}"
  }
}
        stage('Build') {
            steps {
              echo 'Building..'
//              script
//                docker.build registry + ":$BUILD_NUMBER"
//              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'npm install'
//              sh 'sleep 5'
//              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
              sh 'npm run client-install'
              sh 'npm install -g nodemon'              
//              sh 'docker-compose build -d'
//              sh '"$CUR_DIR_VAR"/fix.sh'
//              sh 'rm -rf config'
//              sh 'docker-compose up -d'
            }
        }
        stage('Test') {
            steps {
              sh 'npm test'
                echo 'Testing..'
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
                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
          //Update the imagetag to the latest version
                  sh("sed -i.bak 's#${project}/${appName}:${imageVersion}#${imageTag}#' ./*.yaml")
//                  sh("sed -i.bak 's#${WORKSPACE}/mern_docker_full_stack_app:${imageVersion}#${imageTag}#' ./*.yaml") //or mern_docker_full_stack_app
                  //Create or update resources
//                  sh("kubectl --namespace=${namespace} apply -f ./pv-claim.yaml")
                  sh("kubectl --namespace=${namespace} apply -f ./deployment.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f ./service.yaml")
                  //Add or Update pv-pod volume claim and mount
                  //sh("kubectl --namespace=${namespace} apply -f ./pv-pod.yaml")
          //Grab the external Ip address of the service
                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break
   }
  }
  stage('Remove Unused docker image') {
    steps{
      sh "docker rmi $registry:$BUILD_NUMBER"
    }
  }
}
        post {
          always {
            cleanWs()
    }
  }
}
