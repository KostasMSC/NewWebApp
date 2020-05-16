pipeline {
	environment {
		registry = "kargyris/mytomcat"
		registryCredential = 'dockerhub'
		versionNumber = 2
		dockerImage = ''
	}
    agent any
    stages {
        stage ('Git-checkout') {
            steps {
                echo "Checking out from git repository.";
            }
        }
        stage('Maven Build') {
            steps {
                sh '/opt/apache-maven-3.6.3/bin/mvn package';
            }
        }
        stage('Remove Containers, Images etc') {
            steps {
                sh 'docker system prune -a -f';
            }
        }
		stage('Building image') {
		  steps{
		    script {
		      dockerImage = docker.build registry + ":$versionNumber.$BUILD_NUMBER"
		    }
		  }
		}
		stage('Push Image to Dockerhub') {
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
		    sh "docker rmi -f $registry:$versionNumber.$BUILD_NUMBER"
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