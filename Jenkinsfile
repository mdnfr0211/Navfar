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
                println '[WARNING] Initiating clean up'
                cleanWs()

            }
        }
        success {
            script {
                println 'STATUS: SUCCESSFUL'
                subject = "[SUCCESS]"
                BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"
                msg = "Hi"
                notifystatus('SUCCESS', msg, subject)
            }
        }
    }
}

def notifystatus (String status, String msg, String subject) {
    emailext body: msg, recipientProviders: [$class: 'RequesterRecipientProvider'], 
    subject: 'subject', to: "navfarr15@gmail.com"
}
