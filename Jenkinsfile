#!/usr/share/groovy
// Declarative Pipeline
def project = 'mern-auth'
def appName = 'mern-auth'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def feSvcName = "mern-auth-service"


export "CaCertPath"="/home/patrick/.minikube/certs/ca.pem"
export "ServerCertPath"="/home/patrick/.minikube/machines/server.pem"
export "ClientCertPath"="/home/patrick/.minikube/certs/cert.pem"
//Manual configuration will need to be assigned to your environment for your credentials for API comms.
def = "CaCertPath"="/home/patrick/.minikube/certs/ca.pem"
def = "ServerCertPath"="/home/patrick/.minikube/machines/server.pem"
def = "ClientCertPath"="/home/patrick/.minikube/certs/cert.pem"
	
pipeline {
  agent any
   //agent none
    //stages {
        //stage('Example') {
            //steps
//		environment { 
//              AN_ACCESS_KEY = credentials('my-prefined-secret-text') 
//		CUR_DIR_VAR = "${WORKSPACE}"
//     		JENKINS_PATH = sh(script: 'pwd', , returnStdout: true).trim()
//		PATH = "${pathvar}"
//     		registry = "pstambaugh14/mern-auth-jenks-k8s2"
//     		registryCredential = 'dockerhub'
//      		dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'    
//		}
   stages {
       stage ('Preparation') {
         agent { label 'master'}
           environment {
               JENKINS_PATH = sh(script: 'pwd', , returnStdout: true).trim()
	       CUR_DIR_VAR = "${WORKSPACE}"  
	       registry = "pstambaugh14/mern-auth-jenks-k8s2"
	       dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'	   
	    }
           //stages {
             //stage ('Preparation') {	       
	       steps {
               echo "Hello world"
               echo "PATH=${JENKINS_PATH}"
               sh 'echo "JP=$JENKINS_PATH"'
	   }
       }	       
//   stages {
//        stage('first') {
//                agent { label 'master' }
//               steps {
//                   sh "printenv | sort"
//            }
//	}		
//            printenv
//		steps { 
//		sh 'printenv'
//            }
//        }
//  node
//    returnStdout=true	
//	echo sh(returnStdout: true, script: 'env') 
    // ...
//}	
//    stage('Env_vars') {
 //   steps {
 //   echo 'Establishing Environment Variables..'
 //   pathvar= sh 'printenv |grep -i path'
//}

//    environment {
//      CUR_DIR_VAR = "${WORKSPACE}"
//      PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/var/lib/jenkins/npm/bin"
//      PATH = "${pathvar}"
//      registry = "pstambaugh14/mern-auth-jenks-k8s2"
//      registryCredential = 'dockerhub'
//      dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'
//          }
//   stages {
      stage('Checkout') {
        steps {
        checkout scm }
}
        stage('Initialize') {
          steps {   
//   }
//   stages 
              echo "${appName} is the var for appName"
              echo "${WORKSPACE} is the var for WORKSPACE"
  }
}
//        stage('Build') {
//            steps {
//              echo 'Building..'
//	            sh 'npm init -y'
//             sh 'npm install'
//              sh 'npm run client-install'
//              sh 'npm install nodemon'
//              sh 'cd client && npm init -y'
//              sh 'cd client && npm install'
//              sh 'cd client && npm install nodemon'
//              sh 'npm audit fix'
//            }
//        }
//        stage('Building image') {
//          steps{
//            script {
//              dockerImage = docker.build registry + ":$BUILD_NUMBER"
//            }
//          }
//        }
//        stage('Deploy Image') {
//          steps{
//             script {
//                docker.withRegistry( '', registryCredential ) {
//                dockerImage.push()
//              }
//            }
//          }
//        }
        stage('Deploy Application') {
          steps {
             //sh 'chmod +x "${WORKSPACE}"/pod-check.sh'
	     sh '"${WORKSPACE}"/pod-check.sh'
             sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
             //Update the imagetag to the latest version
             sh("sed -i.bak 's#${project}/${appName}:${imageVersion}#${imageTag}#' ${WORKSPACE}/k8s/deploy/*.yaml")
             //Create or update resources
             sh("kubectl --namespace=${namespace} apply -f ${WORKSPACE}/k8s/deploy/deployment.yaml")
             //Grab the external Ip address of the service
             sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
      }
  }
//        stage('Remove Unused docker image') {
//          steps{
//            sh "docker rmi $registry:$BUILD_NUMBER"
//          }
//      }
}
// IF DESIRED: CLEAN WORKSPACE AFTER BUILD ALSO
        post {
          always {
            cleanWs()
    	}
    }
  }

