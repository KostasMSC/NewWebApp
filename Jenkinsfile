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
		    bat label: '', script: "docker rmi -f $registry:$versionNumber.$BUILD_NUMBER"
		  }
		}
		stage('Deploy docker image') {
		  steps{
		    bat label: '', script: "docker run -d -p 8888:8080 kargyris/mytomcat:$versionNumber.$BUILD_NUMBER --name tomcat"
		  }
		}
		stage('Running Mysql') {
		  steps{
		    bat label: '', script: "docker-compose up"
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