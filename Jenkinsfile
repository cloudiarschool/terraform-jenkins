pipeline {
  agent any
  environment {
    PATH = "${PATH}:${getTerraformPath()}"
  }
  stages {
    stage('Initialize the terraform and create dev environment') {
      steps {
        sh returnStatus: true, script: "terraform workspace new dev"
        sh "terraform init"
        sh "terraform workspace new dev"

      }
    }
  }
}

def getTerraformPath(){
  def tfHome = tool name: 'terraform-12', type: 'terraform'
  return tfHome
}
