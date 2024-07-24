pipeline {
    agent any
      environment {
      DESTROY = "NO"
    }
    stages {
        stage('GetVPC') {
            steps {
                sh 'echo "Lets Get VPC Details"'
                sh 'aws ec2 describe-vpcs --region us-east-1 | jq .Vpcs[].VpcId -r'
            }
        }
        stage('GetRegions') {
            steps {
                sh 'echo "Lets Get Region Details"'
                sh 'aws ec2 describe-regions --region us-east-1 | jq .Regions[].RegionName -r'
            }
        }
        stage('GetVols') {
            steps {
                sh 'echo "Lets Get Volume Details"'
                sh 'aws ec2 describe-volumes --region us-east-1 | jq .Volumes[].VolumeId -r'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Validate & Plan') {
            steps {
                sh 'terraform fmt && terraform validate && terraform plan'
            }
        }
        stage('Terraform Apply & Status') {
            when {
                "${env.DESTROY}" == "NO"
            }
            steps {
                sh 'terraform apply --auto-approve'
                sh 'terraform state list'
            }
        }
        stage('Terraform Destroy') {
            when {
                "${env.DESTROY}" == "YES"
            }
            steps {
                sh 'terraform destroy --auto-approve'
                sh 'terraform state list'
            }
        }
    }
}