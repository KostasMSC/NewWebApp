pipeline {
	environment {
		registry = "kargyris/mytomcat"
		registryCredential = 'dockerhub'
		versionNumber = 1
		dockerImage = ''
	}
    agent any
    stages {
        stage ('Git-checkout') {
            steps {
                echo "Checking out from git repository.";
            }
        }
        stage('Remove Containers') {
            steps {
                powershell label: '', script: 'docker stop $(docker ps -a -q)';
                powershell label: '', script: 'docker rm $(docker ps -a -q)';
            }
        }
        stage('Build') {
            steps {
                echo "Successful build.";
                bat label: '', script: 'C:/Users/argyris/Projects/devtools/apache-maven-3.6.2/bin/mvn package';
            }
        }
		stage('Building image') {
		  steps{
		    script {
		      dockerImage = docker.build registry + ":$versionNumber.$BUILD_NUMBER"
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
		stage('Remove Unused docker image') {
		  steps{
		    powershell label: '', script: "docker rmi -f $registry:$versionNumber.$BUILD_NUMBER"
		  }
		}
		stage('Deploy docker image') {
		  steps{
		    powershell label: '', script: "docker run -d -p 8088:8080 kargyris/mytomcat:$versionNumber.$BUILD_NUMBER"
		  }
		}
		stage('Running Mysql') {
		  steps{
		    powershell label: '', script: "docker-compose up -d"
		  }
		}
    }
    post {
        always {
            echo "Always execute this."
        }
        success  {
            echo "Execute when run is successful."
        }
        failure  {
            echo "Execute run results in failure."
        }
        unstable {
            echo "Execute when run was marked as unstable."
        }
        changed {
            echo "Execute when state of pipeline changed (failed <-> successful)."
        }
    }
}