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
            
            steps { // <==  Add 'steps' block here
                git url: 'https://github.com/rnaveentec/travis_test.git', branch: 'master'
                script {
                    def causes = currentBuild.getBuildCauses()
                    if (causes.any { it._class =~ /TimerTriggerCause/ }) {
                        echo "This is a nightly build (triggered by cron)."
                    } else {
                        echo "Triggered by: ${causes}"
                    }
                }
            }
        }
        stage('Run Python Script') {
            steps { // <==  Add 'steps' block here
                // sh '/usr/bin/python3 test.py'
                sh "make BUILD_TYPE=${params.BUILD_TYPE}"
            }
        }
        stage('Hello') {
            steps {
                echo 'Hello World'
            }
        }
        stage('Nightly Only') {
            when {
                triggeredBy 'TimerTriggerCause'
            }
            steps {
                echo "This is a nightly build (triggered by every minute cron)."
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
