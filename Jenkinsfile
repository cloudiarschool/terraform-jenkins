pipeline {
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages {
    stage('S3 Bucket Create'){
      steps {
        script{
          createS3Bucket('cloudiarterraform')
        }
      }
    }
    stage('Deploy to dev environment') {
      steps {
        sh returnStatus: true, script: "terraform workspace new dev"
        sh "terraform init"
        sh "terraform apply -var-file=dev.tfvars -auto-approve"
      }
    }
    stage('Deploy to prod environment'){
      steps {
        sh returnStatus: true, script: "terraform workspace new prod"
        sh "terraform init"
        sh "terraform apply -var-file=prod.tfvars -auto-approve"
      }
    }
  }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'terraform'
  return tfHome
}

def createS3Bucket(bucketName){
  sh returnStatus: true, script: "aws s3 mb ${bucketName} --region=us-east-1"
}
