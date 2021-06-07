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
                dir('terraformsingleinstance') {
                    sh 'pwd'
                    sh 'packer build -var-file packer-vars.json packer.json | tee output.txt'
                    sh "tail -2 output.txt | head -2 | awk 'match(\$0, /ami-.*/) { print substr(\$0, RSTART, RLENGTH) }' > ami.txt"
                    sh "echo \$(cat ami.txt) > ami.txt"
                    script {
                        def AMIID = readFile('ami.txt').trim()
                        sh "echo variable \\\"imagename\\\" { default = \\\"$AMIID\\\" } >> variables.tf"
                    }
                }
            }
        }
        stage('Terraform Plan') {
            when {
                    expression {
                        params.ACTION == 'YES'
                    }
                }
            steps {
                dir('terraformsingleinstance') {
                    sh 'terraform init'
                    sh 'terraform plan'
                }
            }
        }
        stage('Terraform Apply') {
            when {
                    expression {
                        params.ACTION == 'YES'
                    }
                }
            steps {
                dir('terraformsingleinstance') {
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve'
                }
            }
        }
        stage('Terraform Destroy') {
            when {
                    expression {
                        params.ACTION == 'YES'
                    }
                }
            steps {
                dir('terraformsingleinstance') {
                    sh 'terraform init'
                    sh 'terraform apply --auto-approve'
                }
            }
        }
    }
}
