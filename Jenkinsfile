pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                sh 'BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"'
                sh 'echo "BUILD_TRIGGER_BY: ${BUILD_TRIGGER_BY}"'
            }
        }
    }
}
