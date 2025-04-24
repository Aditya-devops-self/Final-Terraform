pipeline {
    agent any

    environment {
        PATH = "C:/terraform;${env.PATH}"   // Ensure Terraform binary is included
        TF_VAR_aws_access_key = credentials('AWS_ACCESS_KEY')
        TF_VAR_aws_secret_key = credentials('AWS_SECRET_KEY')
    }

    stages {
        stage('Terraform Init') {
            steps {
                bat 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                bat 'terraform plan -out=tfplan'
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
                bat 'terraform apply tfplan'
            }
        }
    }
}
