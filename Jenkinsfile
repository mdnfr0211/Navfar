pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'sudo apt-get install nginx -y'
            }
        }
        stage('stage1') {
            steps {
                wrap([$class: 'BuildUser']) {
                    echo "${BUILD_USER}"
                    echo "${BUILD_USER_ID}"
                    echo "${BUILD_USER_EMAIL}"
                }
            }
        }

    }
}
