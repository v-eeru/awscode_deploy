pipeline {
    agent any

    environment {
        S3_BUCKET = 'awscode-deploy-artifacts'
        ARTIFACTS_PATH = 'https://awscode-deploy-artifacts.s3.ap-south-1.amazonaws.com/artifacts/'
        AWS_REGION = 'ap-south-1' // Adjust based on your region
    }

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building...'
                    
                    // Run install.sh
                    sh 'scripts/install.sh'
                    
                    // Run server.sh
                    sh 'scripts/server.sh'
                    
                    // Add your build steps here if needed
                }
            }
        }
        
        stage('Upload Artifacts to S3') {
            steps {
                script {
                    // Assuming your artifacts are in a specific directory
                    echo 'Uploading artifacts to S3...'
                    sh '''
                        aws s3 cp ${ARTIFACTS_PATH} s3://${S3_BUCKET}/artifacts/ --recursive --region ${AWS_REGION}
                    '''
                }
            }
        }

    
