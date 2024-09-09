pipeline {
    agent any

    stages {
        stage('Debug') {
            steps {
                sh 'rm -rf Diabetes-Care-Connect'
                sh 'git clone https://github.com/JeanAush/Diabetes-Care-Connect'
            }
        }

        stage('Print current working directory') {
            steps {
                sh 'pwd'
            }
        }

        stage('Install dependencies') {
            steps {
                // Navigate to the cloned directory
                dir('Diabetes-Care-Connect') {
                    sh 'npm ci'
                }
            }
        }
        stage('run'){
            steps{
                dir('Diabetes-Care-Connect'){
                 sh 'node index.js'   
                }
            }
        }
    }
}
