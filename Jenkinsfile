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
				sh "sudo ssh -oIdentityFile=/home/ubuntu/.ssh/ProdServer.pem ubuntu@$prodServer sudo docker rmi \$(sudo docker images | grep mytomcat | tr -s ' ' | cut -d ' ' -f 3)"
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