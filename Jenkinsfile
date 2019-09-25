#!/usr/bin/groovy
// Declarative Pipeline
def project = 'mern-auth-jenks-k8s'
def appName = 'mern-auth'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
//def imageTag = "gcr.io/${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def feSvcName = "mern-auth-service"
pipeline {
//    agent {
//        any {
  agent any
  tools {nodejs "Node.js 10.16.3"}
//      image 'node:10.16.3'
//        registryUrl 'https://registry.az1'
//        registryCredentialsId 'pstambaugh14'
//        args '-v /var/jenkins_home/.m2:/root/.m2'
//    }

//            image 'node:10.16.3'
//            }

          environment {
            CUR_DIR_VAR = "${WORKSPACE}"
            PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/var/lib/jenkins/npm/bin"
//            CA_PATH = "/var/lib/jenkins/.docker"
//            CLIENT_CERT_PATH = "/var/lib/jenkins/.docker"
//            TLS_KEY_PATH = "/var/lib/jenkins/.docker"
//            DOCKER_HOST = "https://192.168.0.158:2376"
//            DOCKER_CERT_PATH = "/var/lib/jenkins/.docker/"
//            DOCKER_TLS_VERIFY = "1"
//            DOCKER_HOST = "https://192.168.0.158:2376"
          }
    stages {
      stage('Checkout') {
        steps {
        checkout scm }
}
        stage('Initialize') {
          steps {
//            sh 'echo env.feSvcName} - attempt at finding feSvcName variable'
              echo "${appName}"
//            echo "${feSvcName} - attempt at finding feSvcName variable"
//            echo 'env.CUR_DIR_VAR is now the working directory'
//            echo 'env.WORKSPACE is the first - groovy'
//            echo '"${WORKSPACE}" is the second - groovy'
//            sh 'echo $WORKSPACE is the first - shell'
//            sh 'echo env.WORKSPACE is the second - shell'
//            sh 'echo "${WORKSPACE}" is the third - shell'
  }
}
        stage('Build') {
            steps {
              echo 'Building..'
              //sh '/usr/bin/docker-compose build'
//              sh 'eval $(minikube docker-env)'
              //sh 'docker pull'
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'npm install'
              sh 'sleep 5'
              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
//              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'npm run client-install'
//              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'docker-compose up -d'
//Fix Broken Packages
              sh '"$CUR_DIR_VAR"/fix.sh'
              sh 'rm -rf config'
//              sh '"$CUR_DIR_VAR"/client/fix.sh'
// Install npm
//              sh 'sudo su jenkins'
//              sh 'node -v'
//              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
//              sh '/usr/bin/sudo npm install'
//              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
//              sh '/usr/bin/sudo npm run client-install'

//Fix Broken Packages
//              sh 'sleep 30'
//              sh '"$CUR_DIR_VAR"/fix.sh'
//              sh 'sleep 1'
//              sh '"$CUR_DIR_VAR"/client/fix.sh'
//              sh 'sleep 10'
//              sh '"$CUR_DIR_VAR"/nodemon.sh'
//              sh 'sleep 1'
//              sh '"$CUR_DIR_VAR"/client/fix.sh'
//              sh 'sleep 5'
//              sh 'rm -f "$CUR_DIR_VAR"/client/package-lock.json && npm cache clean --force'
//              sh 'sleep 30'
//              sh 'npm cache clean --force'
//              sh 'npm run client-install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
//        stage('Deploy') {
//            steps {
//                echo 'Deploying....'
                //app-check.sh checks to see if application is running and will spin up if or not running and remove old instance if running
//                sh '"$CUR_DIR_VAR"/app-check.sh'
//            }
//        }
//      }
//Stage 3 : Deploy Application
 stage('Deploy Application') {
      steps {
//      withKubeConfig([
//                    credentialsId: 'jenkins'
//                    caCertificate: '/home/patrick/.minikube/ca.crt'
//                    serverUrl: '192.168.99.100:8443',
//                    contextName: '<context-name>',
//                    clusterName: '<cluster-name>',
//                    namespace: 'development'
//                    ])
//      steps {
//        switch (namespace) {
             //Roll out to Dev Environment
//             case "development":
                  //sh("kubectl --namespace=${namespace} apply -f ")

                  // Create namespace if it doesn't exist
                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
          //Update the imagetag to the latest version
                  sh("sed -i.bak 's#${project}/${appName}:${imageVersion}#${imageTag}#' ./*.yaml")
//                  sh("sed -i.bak 's#${WORKSPACE}/mern_docker_full_stack_app:${imageVersion}#${imageTag}#' ./*.yaml") //or mern_docker_full_stack_app
                  //Create or update resources
//                  sh("kubectl --namespace=${namespace} apply -f ./pv-claim.yaml")
                  sh("kubectl --namespace=${namespace} apply -f ./deployment.yaml")
                  sh("kubectl --namespace=${namespace} apply -f ./service.yaml")
                  //Add or Update pv-pod volume claim and mount
                  //sh("kubectl --namespace=${namespace} apply -f ./pv-pod.yaml")
          //Grab the external Ip address of the service
                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break

       //Roll out to Prod Environment
//             case "production":
                  // Create namespace if it doesn't exist
//                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
          //Update the imagetag to the latest version
//                  sh("sed -i.bak 's#gcr.io/${project}/${appName}:${imageVersion}#${imageTag}#' ./k8s/production/*.yaml")
//          //Create or update resources
//                  sh("kubectl --namespace=${namespace} apply -f k8s/production/deployment.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f k8s/production/service.yaml")
          //Grab the external Ip address of the service
//                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break

//             default:
//                  sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
//                  //sh("sed -i.bak 's#gcr.io/${project}/${appName}:${imageVersion}#${imageTag}#' ./k8s/development/*.yaml")
//                  sh("sed -i.bak 's#gcr.io/${project}/${appName}:${imageVersion}#${imageTag}#' ./*.yaml")
//                  //sh("kubectl --namespace=${namespace} apply -f k8s/development/deployment.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f ./deployment.yaml")
//                  //sh("kubectl --namespace=${namespace} apply -f k8s/development/service.yaml")
//                  sh("kubectl --namespace=${namespace} apply -f ./service.yaml")
//                  sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
//                  break
//        }
   }
  }
}
        //Clean Workspace at the end of Build
//        post {
//          always {
//            cleanWs()
//    }
//  }
}
