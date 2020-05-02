pipeline {
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
        stage('Image') {
            steps {
                echo "Creating Docker Image for Tomcat.";
                bat label: '', script: 'docker build t mytomcat:1.0 f Dockerfile1 .';
            }
        }
        stage('Deploy') {
            steps {
                echo "Successful deployment.";
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