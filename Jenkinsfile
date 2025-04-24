pipeline {
    agent any

    environment {
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY')   // Jenkins credential ID
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_KEY')   // Jenkins credential ID
    }

    stages {
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Approval') {
            steps {
                script {
                    def userInput = input(
                        id: 'Approval', message: 'Do you want to apply Terraform changes?', parameters: [
                            [$class: 'BooleanParameterDefinition', defaultValue: false, description: 'Check to approve apply', name: 'Approve']
                        ]
                    )
                    if (!userInput) {
                        error "Pipeline aborted by user."
                    }
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply tfplan'
            }
        }
    }
}
