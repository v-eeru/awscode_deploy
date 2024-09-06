pipeline {
    agent any

    environment {
        S3_BUCKET = 'awscode-deploy-artifacts'
        ARTIFACTS_PATH = 'https://awscode-deploy-artifacts.s3.ap-south-1.amazonaws.com/artifacts/'
        AWS_REGION = 'ap-south-1'
    }

    stages {
        stage('Build') {
            steps {
                script {
                   
                     echo Installing Nginx
                     sudo apt-get update
                     sudo apt-get install nginx -y
                    
                }
            }
        }
        
        stage('Upload Artifacts to S3') {
            steps {
                script {
                    echo 'Uploading artifacts to S3...'
                    
                    sh '''
                        aws s3 cp ${ARTIFACTS_PATH}/output.zip s3://${S3_BUCKET}/artifacts/output.zip --region ${AWS_REGION}
                    '''
                }
            }
        }
    }

    post {
        success {
            echo 'Build and upload successful!'
        }
        failure {
            echo 'Build or upload failed!'
        }
    }
}
