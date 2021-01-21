pipeline {
    agent any
    environment {
        BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription}"
    }
    stages {
        stage('build') {
            steps {
                sh 'echo "Hello World!"'
		sh 'echo "Testing"'
            }
        }
	stage("source code checkout"){
            steps {
                script {
                    git branch: 'dev', credentialsId: 'cb964396-7c95-493d-8ec9-77ab17154232', url: 'https://github.com/mdnfr0211/Navfar.git'
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
                
                msg = "Build is success \n\n${BUILD_TRIGGER_BY}"
                notifyStatus('SUCCESS', msg, subject)
            }
        }
    }
}

def notifyStatus (String status, String msg, String subject) {
     emailext attachLog: true, body: msg, subject: subject, recipientProviders: [developers()]
}
