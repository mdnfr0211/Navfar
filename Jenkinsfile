pipeline {
    agent any
    stages {
        stage('build') {
            steps {
		'echo "Hello World"'
            }
        }
        stage('stage1') {
            steps {
                wrap([$class: 'BuildUser']) {
                    echo "${BUILD_USER}"
                    
                }
            }
        }

    }
}
