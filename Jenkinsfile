pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh "env"
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
