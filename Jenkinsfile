pipeline {
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages {
    stage('S3 Bucket Create'){
      steps {
        sh "ansible-playbook s3-bucket.yml"
      }
    }
    stage('Deploy to dev environment') {
      steps {
        sh returnStatus: true, script: "terraform workspace new dev"
        sh "terraform init"
        sh "ansible-playbook terraform.yml"
      }
    }
    stage('Deploy to prod environment'){
      steps {
        sh returnStatus: true, script: "terraform workspace new prod"
        sh "terraform init"
        sh "ansible-playbook terraform.yml --extra-vars=prod"
      }
    }
  }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'terraform'
  return tfHome
}
