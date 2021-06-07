pipeline {
    agent any
 
    stages {
        stage('Perform Packer Build') {
            when {
                    expression {
                        params.PACKER_ACTION == 'YES'
                    }
                }
            steps {
                    sh 'pwd'
                    sh 'ls -al'
                    /*sh "echo variable \\\"imagename\\\" { default = \\\"ami-0a8f605a267d739c3\\\" } >> variables.tf"*/
                    sh 'packer build -var-file packer-vars.json packer.json | tee output.txt'
                    sh "tail -2 output.txt | head -2 | awk 'match(\$0, /ami-.*/) { print substr(\$0, RSTART, RLENGTH) }' > ami.txt"
                    sh "echo \$(cat ami.txt) > ami.txt"
                    script {
                        def AMIID = readFile('ami.txt').trim()
                        sh "echo variable \\\"imagename\\\" { default = \\\"$AMIID\\\" } >> variables.tf"
                    }
            }
        }
        stage('No Packer Build') {
            when {
                    expression {
                        params.PACKER_ACTION == 'NO'
                    }
                }
            steps {
                    sh 'pwd'
                    sh 'ls -al'
                    sh "echo variable \\\"imagename\\\" { default = \\\"ami-0b5037f2e6be40526\\\" } >> variables.tf"
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
