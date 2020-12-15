pipeline {
    agent any
    stages {
        stage('build') {
            steps {
                sh 'echo "Hello World"'
            }
        }
        stage('Build1') { 
            steps {
                script {
                    BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"
                    echo "BUILD_TRIGGER_BY: ${BUILD_TRIGGER_BY}"
                }
            }
        }
    }

    post {
        always {
            script {
            BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"
            emailext body: '${BUILD_TRIGGER_BY}', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test', to: "navfarr15@gmail.com"
            }
        }
    }
}
