pipeline {
	environment {
		prodServer = 'ec2-15-161-61-125.eu-south-1.compute.amazonaws.com'
		tomcatImage = "kargyris/mytomcat"
		mysqlImage = "kargyris/mymysql"
		registryCredential = 'dockerhub'
		versionNumber = 2
		dockerTomcatImage = ''
		dockerMysqlImage = ''
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
		stage('Building Mysql image') {
		  steps{
		    script {
		      dockerMysqlImage = docker.build(mysqlImage + ":$versionNumber.$BUILD_NUMBER","-f DockerfileMysql .")
		    }
		  }
		}
		stage('Push Tomcat Image to Dockerhub') {
		  steps{
		     script {
		        docker.withRegistry( '', registryCredential ) {
		        dockerMysqlImage.push()
		      }
		    }
		  }
		}
		stage('Remove Unused Tomcat image') {
		  steps{
		    sh "docker rmi -f $mysqlImage:$versionNumber.$BUILD_NUMBER"
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