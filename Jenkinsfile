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
                sh 'pwd';
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
		stage('Deploy docker image from Dockerhub To Production Server') {
		  steps{
		    sh "sudo ssh -oIdentityFile=/home/ubuntu/.ssh/ProdServer.pem ubuntu@ec2-15-161-61-125.eu-south-1.compute.amazonaws.com \'sudo docker stop \$(sudo docker ps -a -q) || true && sudo docker rm \$(sudo docker ps -a -q) || true\'"
		    sh "sudo ssh -oIdentityFile=/home/ubuntu/.ssh/ProdServer.pem ubuntu@ec2-15-161-61-125.eu-south-1.compute.amazonaws.com \'sudo docker system prune -a -f\'"
		    sh "sudo ssh -oIdentityFile=/home/ubuntu/.ssh/ProdServer.pem ubuntu@ec2-15-161-61-125.eu-south-1.compute.amazonaws.com \'sudo docker run -d -p 8088:8080 $registry:$versionNumber.$BUILD_NUMBER\'"
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