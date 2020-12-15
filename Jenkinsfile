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
    node('master') {
        BUILD_TRIGGER_BY = sh ( script: "BUILD_BY=\$(curl -k --silent ${BUILD_URL}/api/xml | tr '<' '\n' | egrep '^userId>|^userName>' | sed 's/.*>//g' | sed -e '1s/\$/ \\/ /g'); if [[ -z \${BUILD_BY} ]]; then BUILD_BY=\$(curl -k --silent ${BUILD_URL}/api/xml | tr '<' '\n' | grep '^shortDescription>' | sed 's/.*user //g;s/.*by //g'); fi; echo \${BUILD_BY}", returnStdout: true ).trim()
        echo "BUILD_TRIGGER_BY: ${BUILD_TRIGGER_BY}"
    }
}
