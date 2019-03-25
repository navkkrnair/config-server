pipeline {
    agent { 
    label 'jenkins-ssh-slave' 
//      any
    }
           
    stages {
    
         stage('Get Source code from Git') {          	
	        steps {
//	             This piece of code will chekout the files from the configured Git repository where this
//	             Jenkinsfile file was found.
	        	checkout scm
	        	sh script: 'chmod +x ./gradlew'
	      		sh script: './gradlew bootJar'
	      		// This step should not normally be used in your script. Consult the inline help for details.
				script {
   					docker.build('navkkrnair/config-server:1.0')
				}

				

	        }
   		}
   		
//   		stage('Build the Jar') {
//             steps {
//             	sh script: 'chmod +x ./gradlew'
//	      		sh script: './gradlew bootJar'
//	     	}
//	   }
	   
//	   stage('Build Image'){
//			steps {
//				script {
//				         withServer(uri:'tcp://localhost:2375') {
//       					   build('navkkrnair/config-server')
//                	}
//				}
//			}
//   	   }
	}
}