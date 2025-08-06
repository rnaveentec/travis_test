pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps { // <==  Add 'steps' block here
                git url: 'https://github.com/rnaveentec/travis_test.git', branch: 'main'
            }
        }
        stage('Run Python Script') {
            steps { // <==  Add 'steps' block here
                sh 'python test.py'
            }
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
