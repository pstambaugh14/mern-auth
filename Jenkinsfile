#!/usr/share/groovy
// Declarative Pipeline
def project = 'mern-auth'
def appName = 'mern-auth'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def feSvcName = "mern-auth-service"


//export "CaCertPath"="/home/patrick/.minikube/certs/ca.pem"
//export "ServerCertPath"="/home/patrick/.minikube/machines/server.pem"
//export "ClientCertPath"="/home/patrick/.minikube/certs/cert.pem"
//Manual configuration will need to be assigned to your environment for your credentials for API comms.
//def = "CaCertPath"="/home/patrick/.minikube/certs/ca.pem"
//def = "ServerCertPath"="/home/patrick/.minikube/machines/server.pem"
//def = "ClientCertPath"="/home/patrick/.minikube/certs/cert.pem"

pipeline {
  agent any
  environment {
//      JENKINS_PATH = sh(script: 'pwd', , returnStdout: true).trim()
      //DEBUG_FLAGS = '-g'
      //JENKINS_PATH = "${PWD}"
      //SHELL = "/bin/bash"
      //PATH = "${PATH}"
      registry = 'pstambaugh14/mern-auth-jenks-k8s2'
      dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'
      //PATH1 = sh(script: '`whereis minikube`', , returnStdout: true).trim()
    }
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
         environment {
            DEBUG_FLAGS = '-g'
            //CUR_DIR_VAR = "${WORKSPACE}"
            //PATH = "${PATH}"
          }
         agent { label 'master'}
         steps {
               echo 'Establishing Environment Variables..'
               sh 'printenv'
               echo '$PATH'
               echo "${PATH}"
               //echo '$PATH'
               //pathvar = sh 'printenv |grep -i path'
               //echo "${pathvar}"
               echo "Hello world"
               //echo '$PATH'=PATH
               //sh 'echo "JP=$JENKINS_PATH"'
               echo "${WORKSPACE}"
               //sh 'PATH1=`whereis minikube`'
//               sh """#!/bin/bash
//               PATH2=`echo $PATH1 | awk '{ print \$2 }' | sed 's/minikube//g'`
//               """`
               //echo "${$PATH2}"
	     }
  }
//           environment {
//               //JENKINS_PATH = sh(script: 'pwd', , returnStdout: true).trim()
//               SHELL = '/bin/bash'
//               PATH = '$PATH'
//               CUR_DIR_VAR = "${WORKSPACE}"
//	             registry = "pstambaugh14/mern-auth-jenks-k8s2"
//	             dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'
//               PATH1 = sh(script: '`whereis minikube`', , returnStdout: true).trim()
//               sh """#!/bin/bash
//               PATH2=`echo $PATH1 | awk '{ print \$2 }' | sed 's/minikube//g'`
//               """`

               //PATH2 = sh(script: '`echo "$PATH1" | awk '{ print "${2}" }' | sed 's/minikube//g'`', , returnStdout: true).trim()
        //       PATH2 = "$PATH15"
               //sh """#!/bin/bash
               //PATH2=`echo $PATH1 | awk '{ print \$2 }' | sed 's/minikube//g'`
               //"""
               //PATH2 = "$PATH2"
               //sh 'PATH2=`echo $PATH1 | awk '{ print \$2 }' | sed 's/minikube//g'`'
               //MK_HOME = "${PATH2}"

                 //stages {
                 //stage ('Preparation') {

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
      stage ('Checkout') {
        //node {
          steps {
        checkout scm }
}
        stage ('Initialize') {
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
        stage ('Deploy Application') {
            environment {
               DEBUG_FLAGS = '-g'
               //CUR_DIR_VAR = "${WORKSPACE}"
               //PATH = '$PATH'
               //PATH = "${PATH}"
            }
            agent { label 'master'}
            steps {
                  echo 'Establishing Environment Variables..'
                  sh 'printenv'
                  echo '$PATH'
                  echo "${PATH}"
                  //echo '$PATH'
                  //pathvar = sh 'printenv |grep -i path'
                  //echo "${pathvar}"
                  //echo "Hello world"
                  //echo '$PATH'=PATH
                  //sh 'echo "JP=$JENKINS_PATH"'
                  echo "${WORKSPACE}"

             sh 'chmod 0744 "${WORKSPACE}"/pod-check.sh'
	           sh '"${WORKSPACE}"/pod-check.sh'
             sh("kubectl get ns ${namespace} || kubectl create ns ${namespace}")
             //Update the imagetag to the latest version
             sh("sed -i.bak 's#${project}/${appName}:${imageVersion}#${imageTag}#' ${WORKSPACE}/k8s/deploy/*.yaml")
             //Create or update resources
             sh("kubectl --namespace=${namespace} apply -f ${WORKSPACE}/k8s/deploy/deployment.yaml")
             //Grab the external IP address of the service
             //sh("echo http://`kubectl --namespace=${namespace} get service/${feSvcName} --output=json | jq -r '.status.loadBalancer.ingress[0].ip'` > ${feSvcName}")
             //Grab the internal IP address of the service if using Minikube
             //sh("minikube service list | grep -i ${feSvcName} | awk '{ print $6 }' > ${feSvcName}")
             //sh 'printenv'
       }
}
        stage ('List mern-auth Service IP and Port for Access') {
          environment {
             DEBUG_FLAGS = '-g'
             //CUR_DIR_VAR = "${WORKSPACE}"
             //PATH = "${PATH}"
             //MK_HOME = "${MINI2}"
          }
          agent { label 'master'}
          steps {
                //echo 'Establishing Environment Variables..'
                //sh 'printenv'
                //echo '$PATH'
                //echo "$PATH"
                //echo "${PATH}"
             //node {
               //steps {
                 //PATH1 = sh(script: '`whereis minikube`', , returnStdout: true).trim()
                 //sh """#!/bin/bash
                 //PATH1 = `'whereis minikube'`
                 //PATH2 =`echo "{$PATH1}" | awk '{ print \$2 }' | sed 's/minikube//g'`
                 //"""
                 //sh('"${WORKSPACE}"/mkpath.sh')
//               withEnv(['MK_HOME=${MINI2}']) {
//                 withCredentials([usernamePassword(credentialsId: '609ae012-c8a0-4d24-a667-1875d98939dc', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
                     // some block
                     //sh('"${WORKSPACE}"/service-ip.sh')
                  //sh "${WORKSPACE}"/service-ip.sh
//                 withCredentials([usernamePassword(credentialsId: 'ddc3a64c-7949-4126-b363-7a4f5a9eae90', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')]) {
//                   sh """#!/bin/bash
//                   '"${MK_HOME}"/minikube service list | grep -i "${feSvcName}" | awk '{ print "\$6" }'  > "${feSvcName}"'
//                   """
//                 }
             // some block
                    //}
                  //}
                 //sh 'chmod 0744 ${WORKSPACE}/mkpath.sh'
                 //sh '${WORKSPACE}/mkpath.sh'
                 //sh """#!/bin/bash
                 //echo "${path2}"
                 //sh 'echo $PATH2'
                 //export PATH2=$PATH2
                 //sh 'chmod 0744 ${WORKSPACE}/service-ip.sh'
                 sh '${WORKSPACE}/service-ip.sh'
                 echo "this is stoppid"
                 //echo USERNAME
                 //sh ("${path2} service list | grep -i ${feSvcName} | awk '{ print "${6}" }'")
                 //"""
             //}
           //}

             //withCredentials([usernamePassword(credentialsId: 'ddc3a64c-7949-4126-b363-7a4f5a9eae90', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
               // available as an env variable, but will be masked if you try to print it out any which way
               // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
               //sh 'echo $PASSWORD'
               // also available as a Groovy variable
               //echo USERNAME
               // or inside double quotes for string interpolation
               //echo "username is $USERNAME"
          //}   //}

         //}
             //sh 'minikube service list | grep -i "${feSvcName}" | awk '{ print "$6" }' > "${feSvcName}"'
      }
  }
//        stage('Remove Unused docker image') {
//          steps{
//            sh "docker rmi $registry:$BUILD_NUMBER"
//          }
//      }
//}
// IF DESIRED: CLEAN WORKSPACE AFTER BUILD ALSO
        post {
          always {
            cleanWs()
    	}
    }
  )
}
