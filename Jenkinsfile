pipeline {
    agent any
    stages {
        stage('Build') { 
            steps {
                node ('master') {  
                    stage('Build1') { 
                        BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"
                        echo "BUILD_TRIGGER_BY: ${BUILD_TRIGGER_BY}"
                    }
                }
            }
        }
    }
}
