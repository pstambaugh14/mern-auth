#!/usr/share/groovy
// Declarative Pipeline
def project = 'mern-auth'
def appName = 'mern-auth'
def serviceName = "${appName}-service"
def imageVersion = 'latest'
def namespace = 'development'
def imageTag = "${project}/${appName}:${imageVersion}.${env.BUILD_NUMBER}"
def feSvcName = "mern-auth-service"


pipeline {
  agent any
  environment {
      registry = 'pstambaugh14/mern-auth-jenks-k8s2'
      dockerImage = 'pstambaugh14/mern-auth-jenks-k8s2'
    }
   stages {
       stage ('Preparation') {
         environment {
            DEBUG_FLAGS = '-g'
          }
         agent { label 'master'}
         steps {
               echo 'Establishing Environment Variables..'
               sh 'printenv'
               echo '$PATH'
               echo "${PATH}"
               echo "Hello world"
               echo "${WORKSPACE}"
	     }
  }
      //stage ('Checkout') {
          //steps {
        //checkout scm }
//}
        stage ('Initialize') {
          steps {
              echo "${appName} is the var for appName"
              echo "${WORKSPACE} is the var for WORKSPACE"
  }
}
        stage ('Deploy Application') {
            environment {
               DEBUG_FLAGS = '-g'
            }
            agent { label 'master'}
            steps {
                  echo 'Establishing Environment Variables..'
                  sh 'printenv'
                  echo '$PATH'
                  echo "${PATH}"
                  echo "${WORKSPACE}"
             //sh 'whoami && id && w'
             //sh 'chmod 0744 "${WORKSPACE}"/pod-check.sh'
	           //sh '"${WORKSPACE}"/pod-check.sh'
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
          }
          agent { label 'master'}
          steps {
                 sh '${WORKSPACE}/service-ip.sh'
  }
}
//        stage('Remove Unused docker image') {
//          steps{
//            sh "docker rmi $registry:$BUILD_NUMBER"
//          }
//      }
//}
// IF DESIRED: CLEAN WORKSPACE AFTER BUILD ALSO
      //  post {
      //    always {
      //      cleanWs()
    	//}
    //}
//  )
//}
