def project = 'xenon-poet-229608'
def  appName = 'config-server'
def  feSvcName = "${appName}"
def  imageTag = "gcr.io/${project}/${appName}:${env.BUILD_NUMBER}"

pipeline {
  agent {
    kubernetes {
      label 'config-server'
      defaultContainer 'jnlp'
      yaml """
apiVersion: v1
kind: Pod
metadata:
labels:
  component: ci
spec:
  # Use service account that can deploy to all namespaces
  serviceAccountName: cd-jenkins
  containers:
  - name: gradle
    image: gcr.io/cloud-builders/gradle
    command:
    - cat
    tty: true
  - name: gcloud
    image: gcr.io/cloud-builders/gcloud
    command:
    - cat
    tty: true
  - name: kubectl
    image: gcr.io/cloud-builders/kubectl
    command:
    - cat
    tty: true
"""
}
  }
  stages {
  stage('Build jar') {
      steps {
        container('gradle') {
	  sh "./gradlew bootJar"
        }
      }
    }
	  
    stage('Build and push image with Container Builder') {
      steps {
        container('gcloud') {
	  sh "PYTHONUNBUFFERED=1 gcloud builds submit -t ${imageTag} ."
        }
      }
    }
    
    stage('Deploy Production') {
      // Production branch
      steps{
        container('kubectl') {
        // Change deployed image in canary to the one we just built
          sh("sed -i.bak 's#gcr.io/cloud-solutions-images/config-server:1.0#${imageTag}#' ./k8s/production/*.yaml")
          sh("kubectl apply -f k8s/production/")
        }
      }
    }
  }
}
