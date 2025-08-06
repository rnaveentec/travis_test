pipeline {
    agent any

    stages {
        stage('Checkout') {
            git url: 'https://github.com/rnaveentec/travis_test.git', branch: 'main'
        }
        stage('Run Python Script') {
            sh 'python test.py'
        }
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
    }
    post {
        always {
            cleanWs()
            echo 'Workspace cleanup complete.'
        }
    }
}
