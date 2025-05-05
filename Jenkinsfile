pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-access-key')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret-key')
        TERRAFORM_PATH        = 'C:\\Terraform\\terraform.exe'
    }

    stages {
        stage('Terraform Init') {
            steps {
                bat """
                set AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}
                set AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}
                ${env.TERRAFORM_PATH} init
                """
            }
        }
        stage('Terraform Plan') {
            steps {
                bat """
                set AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}
                set AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}
                ${env.TERRAFORM_PATH} plan
                """
            }
        }
    }
}
