pipeline {
    agent any
    stages {
        stage('build') {
            steps {
		sh 'echo "Hello World"'
            }
        }
        stage('stage1') {
            steps {
                wrap([$class: 'BuildUser']) {
                    echo "${BUILD_USER}"
		    echo "${BUILD_USER_ID}"
                    
                    
                }
            }
        }

    }
    BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"
    echo "BUILD_TRIGGER_BY: ${BUILD_TRIGGER_BY}"
}
