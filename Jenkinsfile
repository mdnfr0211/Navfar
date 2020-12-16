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
                msg = "${BUILD_TRIGGER_BY} \n\nHi"
                notifyStatus('SUCCESS', msg, subject)
            }
        }
    }
}

def notifyStatus (String status, String msg, String subject) {
     emailext attachLog: true, body: msg, subject: subject, to: "navfarr15@gmail.com"
}
