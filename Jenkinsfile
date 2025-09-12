pipeline {
    agent any
    parameters {
        booleanParam(name: 'force_build', defaultValue: false, description: 'Force a build to run?')
    }
    /*
    triggers {
        cron('* * * * *')
    }
    */
    stages {
        stage('Checkout') {
            def causes = currentBuild.rawBuild.getCauses()
            if (causes.any { it.toString().contains("TimerTriggerCause") }) {
                echo 'Nightly build triggered'
            }
            steps { // <==  Add 'steps' block here
                git url: 'https://github.com/rnaveentec/travis_test.git', branch: 'master'
            }
        }
        stage('Run Python Script') {
            steps { // <==  Add 'steps' block here
                sh '/usr/bin/python3 test.py'
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
