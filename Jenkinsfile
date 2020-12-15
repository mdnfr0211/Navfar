node {  
    stage('Build') { 
        BUILD_TRIGGER_BY = "${currentBuild.getBuildCauses()[0].shortDescription} / ${currentBuild.getBuildCauses()[0].userId}"
        echo "BUILD_TRIGGER_BY: ${BUILD_TRIGGER_BY}"
    }
    post {
        always {
            emailext body: '${BUILD_TRIGGER_BY}', recipientProviders: [[$class: 'DevelopersRecipientProvider'], [$class: 'RequesterRecipientProvider']], subject: 'Test'
        }
    }
}
