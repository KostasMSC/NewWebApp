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
        stage('Remove Containers') {
            steps {
                sh 'docker stop $(docker ps -a -q)';
                sh 'docker rm $(docker ps -a -q)';
            }
        }
        stage('Build') {
            steps {
                echo "Successful build.";
                sh 'mvn package';
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
		    sh "docker rmi -f $registry:$versionNumber.$BUILD_NUMBER"
		  }
		}
		stage('Deploy docker image') {
		  steps{
		    sh "docker run -d -p 8088:8080 kargyris/mytomcat:$versionNumber.$BUILD_NUMBER"
		  }
		}
		stage('Running Mysql') {
		  steps{
		    sh "docker-compose up -d"
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