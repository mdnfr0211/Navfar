pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh "echo "Hi""
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
