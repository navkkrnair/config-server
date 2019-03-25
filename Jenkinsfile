pipeline {
    agent { 
    	label 'jenkins-ssh-slave' 
    }
           
    stages {
    
         stage('Get Source code from Git') {          	
	        steps {
//	             This piece of code will chekout the files from the configured Git repository where this
//	             Jenkinsfile file was found.
	        	checkout scm
	        }
   		}
   		
   		stage('Build the Jar') {
             steps {
             	sh script: 'chmod +x ./gradlew'
	      		sh script: './gradlew bootJar'
	     	}
	   }
	   
	   stage('Build Image'){
			steps {
				script {
   					docker.build('navkkrnair/config-server:1.0')
				}
			}
		}
	}
}