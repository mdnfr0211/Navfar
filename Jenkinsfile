pipeline {
    agent any
    environment {
        ecr_repo_url = "824158444038.dkr.ecr.ap-south-1.amazonaws.com"
        ecr_repo_name = "test"
        region = "ap-south-1"
        name = "service"
    }
    stages {
        stage("cleaning workspace"){
            steps{
                cleanWs()
            }
        }
        stage ("SRC"){
            steps {
                script {
                    git branch: 'Docker', credentialsId: '45e91bdf-9fbf-468b-a423-1a2d4876f4ae', url: 'https://github.com/mdnfr0211/Navfar.git'
                }
            }
        }
        stage("Build"){
            steps {
                script {
                    sh'''
                    aws ecr get-login-password --region ${region} | sudo docker login --username AWS --password-stdin $ecr_repo_url
                    sudo docker build -t $name .
                    sudo docker tag $name ${ecr_repo_url}/${ecr_repo_name}:v$BUILD_NUMBER

                    set +e
                    Image_List="$(aws ecr describe-images --repository-name test --image-ids imageTag=v_$BUILD_NUMBER 2> /dev/null 1> /dev/null)"
                    status=$?
                    set -e
                    echo $status

                    if [[ "$status" == 0 ]]; then
                                        echo "v_$BUILD_NUMBER already exist in $ecr_repo_name"
                                    else
                                        echo "push"
                                        sudo docker push 824158444038.dkr.ecr.ap-south-1.amazonaws.com/test:v$BUILD_NUMBER
                                        sudo docker rmi 824158444038.dkr.ecr.ap-south-1.amazonaws.com/test:v$BUILD_NUMBER
                                    fi

                    '''
                }
            }
        }
    }
}

