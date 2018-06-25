pipeline {
    agent any   
    stages {
        stage('Checkout') {
            steps {
                echo "Start checkout project"
                sh 'env'
                step([$class: 'WsCleanup'])
                git url: 'https://github.com/msy53719/Jmeter_Anttest.git', branch: 'master'
                echo 'get artifact from pulugins  pipeline.'
            }
        }
        
        stage('Smoking Test') {
            steps {
                sh 'env'
                echo 'Start test'
                sh 'sh ./script/execute_test.sh'
            }
        }
    }
    post {
        always {
            echo 'test'
        }
        failure {
            echo 'this area is run when failure'
        }
    }

}

