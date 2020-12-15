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
}
