pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    echo 'Building...'
                    // Include your build steps here if needed
                }
            }
        }
        
        stage('Deploy to AWS') {
            steps {
                script {
                    // Define CodeDeploy configuration here
                    def deployApplication = {
                        awsCodeDeploy(
                            applicationName: 'your-application-name',
                            deploymentGroupName: 'your-deployment-group-name',
                            deploymentConfigName: 'CodeDeployDefault.AllAtOnce',
                            description: 'Deploying application',
                            region: 'us-west-2' // Adjust based on your region
                        )
                    }
                    deployApplication()
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
