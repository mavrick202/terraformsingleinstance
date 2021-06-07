pipeline {
    agent any
 
    stages {
        stage('Perform Packer Build') {
            when {
                    expression {
                        env.BRANCH_NAME == 'devopsb17terrafornjenkins'
                    }
                }
            steps {
                    sh 'pwd'
                    sh 'ls -al'
                    sh "echo variable \\\"imagename\\\" { default = \\\"ami-0a8f605a267d739c3\\\" } >> variables.tf"
            }
        }
        stage('Terraform Plan') {
            when {
                    expression {
                        params.ACTION == 'DEPLOY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            when {
                    expression {
                        params.ACTION == 'DEPLOY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve'
            }
        }
        stage('Terraform Destroy') {
            when {
                    expression {
                        params.ACTION == 'DESTROY'
                    }
                }
            steps {
                    sh 'terraform init'
                    sh 'terraform destroy --auto-approve'
                }
        }
    }
}
